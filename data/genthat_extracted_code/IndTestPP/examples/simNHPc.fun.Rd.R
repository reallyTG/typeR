library(IndTestPP)


### Name: simNHPc.fun
### Title: Generate the occurrence points of a Poisson process in
###   continuous time
### Aliases: simNHPc.fun buscar

### ** Examples


#Generation  of a HPP 
aux<-simNHPc.fun(lambda=rep(0.1,200),fixed.seed=123)
aux$posNH


#Generation of a NHPP 
set.seed(123)
lambdat<-runif(500, 0.01,0.1)
aux<-simNHPc.fun(lambda=lambdat,fixed.seed=123)
aux$posNH



