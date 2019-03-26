library(markovchain)


### Name: noofVisitsDist
### Title: return a joint pdf of the number of visits to the various states
###   of the DTMC
### Aliases: noofVisitsDist

### ** Examples

transMatr<-matrix(c(0.4,0.6,.3,.7),nrow=2,byrow=TRUE)
simpleMc<-new("markovchain", states=c("a","b"),
             transitionMatrix=transMatr, 
             name="simpleMc")   
noofVisitsDist(simpleMc,5,"a")




