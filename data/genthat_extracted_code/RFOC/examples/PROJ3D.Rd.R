library(RFOC)


### Name: PROJ3D
### Title: Project 3D
### Aliases: PROJ3D
### Keywords: misc

### ** Examples

  block1 = matrix(c(0,0,0,
      1,0,0,
      1,0.5,0,
      0,0.5,0,
      0,0,-2,
      1,0,-2,
      1,0.5,-2,
      0,0.5,-2), byrow=TRUE, ncol=3)

    Bblock1 = makeblock3D(block1)

    R3 = ROTX(-40)
    R2 = ROTY(0)
    R1 = ROTZ(20)
    T =  TRANmat(.1, 0, 0 )
    M =     R1  %*% R2  %*%  R3  %*% T

    T2 =  TRANmat(1, 0.5, 0 )
    MT =       T2 %*%   R1  %*% R2  %*%   R3 %*% T

    Z1 =  PROJ3D(Bblock1$aglyph, M=MT,  anorms=Bblock1$anorm , zee=c(0,0,1))





