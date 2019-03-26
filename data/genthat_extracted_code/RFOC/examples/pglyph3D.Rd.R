library(RFOC)


### Name: pglyph3D
### Title: Plot a 3D body on an existing graphic
### Aliases: pglyph3D
### Keywords: aplot

### ** Examples


### create the 3D object
len = .7
basethick=.05
headlip=.02
headlen=.3

####  create a 3D glyph structure
aglyph = Z3Darrow(len = len , basethick =basethick , headlen =headlen ,
headlip=headlip )

#### define the up vector 
myzee = matrix(c(0,0,1, 1), nrow=1, ncol=4)

##### set rotation angles:
gamma =12
beta =39
alpha = 62

########  set up rotation matrix
R3 = ROTZ(gamma)

R2 = ROTY(beta)

R1 = ROTZ(alpha)

###  create rotation matrix
M =      R1  

M2 =       R1  


plot(c(-1,1), c(-1,1))

 pglyph3D(aglyph$aglyph, anorms=aglyph$anorm  , M=M, M2=M2, zee=myzee ,
col=rgb(.7, 0,0) )






