library(geophys)


### Name: Maxstress
### Title: Maximum Stress
### Aliases: Maxstress
### Keywords: misc

### ** Examples



  S = stressSETUP( )

Nvec = NORMvec(S$PPs, S$xscale, S$Rview, S$aglyph , add = FALSE)

Stensor = matrix(c(
15, 0, 0,
0, 8, 0,
0,  0, 5), ncol=3)

 

Mstress  = Maxstress(Nvec, Stensor)

DoMohr(Stensor)
 axis(1)
axis(2)


points(Mstress$sigNORMmax , Mstress$tauSHEARmax, pch=21, col='blue'  , bg='gold' )

u=par('usr')

segments(0, Mstress$tauSHEARmax, Mstress$sigNORMmax ,
Mstress$tauSHEARmax, lty=2, col='green'  )

text(mean(c(0, Mstress$tauSHEARmax)),  Mstress$tauSHEARmax,
"MaxShear in Plane", pos=3)


segments(Mstress$sigNORMmax , u[3] , Mstress$sigNORMmax ,
Mstress$tauSHEARmax, lty=2, col='purple'  )

text(Mstress$sigNORMmax , u[3], "MaxNormal stress", adj=c(0,-1) )





