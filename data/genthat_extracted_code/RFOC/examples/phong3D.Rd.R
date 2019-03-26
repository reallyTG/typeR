library(RFOC)


### Name: phong3D
### Title: Phong shading for a 3D body
### Aliases: phong3D
### Keywords: aplot

### ** Examples



###########  create a block and rotation matrix, then color it
ANG=(45)
DEGRAD = pi/180

y1 = 1.5

  y2 = y1 - 1/tan((ANG)*DEGRAD)


  z1 = 1
  x1 = 1


Ablock1 = matrix(c(0,0,0,
    1,0,0,
    1,y1,0,
    0,y1,0,
    0,0,-1,
    1,0,-1,
    1,y2,-1,
    0,y2,-1), byrow=TRUE, ncol=3)


Nblock1 = makeblock3D(Ablock1)
Light=c(45,45)
angz = -45
angx = -45

R1 = ROTZ(angz)
R2 = ROTX(angx)

   M =    R1 

Z2 = PROJ3D(Nblock1$aglyph, M=M,  anorms=Nblock1$anorm ,  zee=c(0,0,1))
RangesX = range(attr(Z2, "RangesX"))

  RangesY = range(attr(Z2, "RangesY"))


plot( RangesX, RangesY, type='n', asp=1, ann=FALSE, axes=FALSE)

phong3D(Nblock1$aglyph, M=M,  anorms=Nblock1$anorm , Light = Light,
zee=c(0,0,1), col=rgb(.7,.5, .5)  , border="black")






