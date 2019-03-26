library(RFOC)


### Name: bang
### Title: Angle between two 2D normalized vectors
### Aliases: bang
### Keywords: array

### ** Examples

v1 = c(5,3)
v2 = c(6,1)

a1 = c(5,3)/sqrt(v1[1]^2+v1[2]^2)
a2 = c(6,1)/sqrt(v2[1]^2+v2[2]^2)

plot(c(0, v1[1],v2[1] ) , c(0, v1[2],v2[2]), type='n', xlab="x", ylab="y" )
text(c(v1[1],v2[1]) , c(v1[2],v2[2]), labels=c("v1", "v2"), pos=3, xpd=TRUE)

arrows(0, 0, c(v1[1],v2[1] ), c(v1[2],v2[2]))

B  = 180*bang(a1[1], a1[2], a2[1], a2[2])/pi
title(paste(sep=" ", "Angle from V1 to V2=",format(B, digits=2)) )






