
Strict

Import Bmx3d.Max3d

Max3dGraphics 1024,768

SetClearColor 0,0,1

DisableShadows

EnableCollisions 1,2,0,0,1

Local yellow=CreateMaterial()
SetMaterialColor yellow,"DiffuseColor",1,1,0

Local room_mat=LoadMaterial( "stonefloor.jpg" )
Local room=CreateBox( room_mat,10,10,10,0,0 )
FlipModel room

Local box_mat=LoadMaterial( "eurofan.png" )
Local pbody
For Local y=5 To 1 Step -1
	Local body=CreateCapsule( yellow,.1,.8,3,1 )
	MoveEntity body,0,-.4,0
	ResetModelTransform body
	MoveEntity body,0,y,0
	CreateBallJoint body,body,pbody
	pbody=body
Next
Local box=CreateBox( box_mat,1,1,1,2,1 )
MoveEntity box,0,-.5,0
ResetModelTransform box
CreateBallJoint box,box,pbody

Local light=CreateSpotLight()
MoveEntity light,0,4,-4
TurnEntity light,0,45,0
SetLightRange light,25

Local camera=CreateCamera()
CreateSphereBody camera,.5,1,-1

Local yaw#,pitch#,zoom#=-5

While Not KeyHit( KEY_ESCAPE )

	If KeyDown( KEY_LEFT )
		yaw:-1
	Else If KeyDown( KEY_RIGHT )
		yaw:+1
	EndIf
	
	If KeyDown( KEY_UP )
		pitch:+1
	Else If KeyDown( KEY_DOWN )
		pitch:-1
	EndIf

	If KeyDown( KEY_A )
		zoom:+.1
	Else If KeyDown( KEY_Z )
		zoom:-.1
	EndIf
	
	SetEntityTranslation camera,0,0,0
	SetEntityRotation camera,yaw,pitch,0
	MoveEntity camera,0,0,zoom
	
	UpdateWorld
	RenderWorld
	
	Flip 
	
Wend
