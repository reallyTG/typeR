library(dave)


### Name: vvelocity
### Title: Printing ordinations of velocity and acceleration and
###   differently transformed speed profiles
### Aliases: vvelocity vvelocity.default plot.vvelocity vvelocity2
### Keywords: ts multivariate

### ** Examples

tlabs<- c(1,15,48,60,100,122,145)
timescale<- psit$Years.B.P
o.vvel<- vvelocity(pveg,timescale,y=0.5)
plot(o.vvel,tlabs=tlabs,scal=1)



