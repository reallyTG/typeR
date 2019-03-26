library(RTOMO)


### Name: get3Drayblox
### Title: Get blocks from 3D ray path
### Aliases: get3Drayblox
### Keywords: misc

### ** Examples



xo = seq(from=0.5, by=1, length=100)
yo = seq(from=0.5, by=1, length=100)
 ztop = seq(from=0, to=24, by=4)




Xp = c(11.5, 70.2)
Yp = c(3.5, 50.2)
Zp = c(18.4, 0.0)

dee = sqrt(  (Xp[2]-Xp[1])^2 + (Yp[2]-Yp[1])^2 +  (Zp[2]-Zp[1])^2 )
deexy = sqrt(  (Xp[2]-Xp[1])^2 + (Yp[2]-Yp[1])^2  )

fi  = findInterval(Zp, ztop)

ZNOD = c(Zp[1], ztop[fi[1]:fi[2]])


alpha = asin(deexy/dee)

RN = deexy-ZNOD*tan(alpha)

XNOD = Xp[1]+RN*(Xp[2]-Xp[1])/deexy
YNOD = Yp[1]+RN*(Yp[2]-Yp[1])/deexy

IYZ = get3Drayblox(XNOD, YNOD, ZNOD, xo, yo, ztop, slowness = NULL)







