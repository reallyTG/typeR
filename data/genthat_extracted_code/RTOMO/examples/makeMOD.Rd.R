library(RTOMO)


### Name: makeMOD
### Title: Make a 3D model
### Aliases: makeMOD
### Keywords: misc

### ** Examples



data(HELMOD)
data(HEL1D)

xo = HELMOD$x
yo = HELMOD$y
ztop=HEL1D$zp[1:15]
bg = HEL1D$vp[1:15]
x = 10
y = 15
z = 6
r = 6
v = 3




TM1 = makeMOD(xo, yo, ztop , x, y, z, r, v , bg )
SHOWTOMO(TM1)




