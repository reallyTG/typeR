library(GNE)


### Name: compl
### Title: Complementarity functions
### Aliases: complementarity phiFB phipFB phirFB phiMin phiMan phiKK phiLT
###   GrAphiFB GrBphiFB GrAphipFB GrBphipFB GrAphirFB GrBphirFB GrAphiMin
###   GrBphiMin GrAphiMan GrBphiMan GrAphiKK GrBphiKK GrAphiLT GrBphiLT
###   compl.par print.compl.par summary.compl.par
### Keywords: nonlinear optimize

### ** Examples


phiFB(1, 2)
phiLT(1, 2, 2)
phiKK(1, 2, 1)

-2*phiMin(1, 2)
phiMan(1, 2, function(t) t)

complFB <- compl.par("FB") 
summary(complFB)

complKK <- compl.par("KK", lambda=1) 
summary(complKK)

complKK$fun(1, 1, complKK$lambda)
complFB$fun(1, 1)




