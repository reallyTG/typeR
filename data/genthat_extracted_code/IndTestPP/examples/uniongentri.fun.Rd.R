library(IndTestPP)


### Name: uniongentri.fun
### Title: Calculates the set of close points of each point in a process
### Aliases: uniongentri.fun genbiPos.fun gentriPos.fun

### ** Examples


set.seed(123)
posx<-sort(runif(20,0,1000))
posy<-sort(runif(25,0,1000))
posz<-sort(runif(40,0,1000))
aux<-uniongentri.fun(posx, posy, posz, info=TRUE)



