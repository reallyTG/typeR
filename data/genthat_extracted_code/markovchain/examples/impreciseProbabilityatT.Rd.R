library(markovchain)


### Name: impreciseProbabilityatT
### Title: Calculating full conditional probability using lower rate
###   transition matrix
### Aliases: impreciseProbabilityatT

### ** Examples

states <- c("n","y")
Q <- matrix(c(-1,1,1,-1),nrow = 2,byrow = TRUE,dimnames = list(states,states))
range <- matrix(c(1/52,3/52,1/2,2),nrow = 2,byrow = 2)
name <- "testictmc"
ictmc <- new("ictmc",states = states,Q = Q,range = range,name = name)
impreciseProbabilityatT(ictmc,2,0,1,10^-3,TRUE)




