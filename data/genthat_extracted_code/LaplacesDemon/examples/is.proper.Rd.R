library(LaplacesDemon)


### Name: is.proper
### Title: Logical Check of Propriety
### Aliases: is.proper
### Keywords: Diagnostic Distribution Utility

### ** Examples

library(LaplacesDemon)
### Prior Probability Distribution
is.proper(function(x) {dnormv(x,0,1000)}, -Inf, Inf) #x ~ N(0,1000)
is.proper(function(x) {dhalfcauchy(x,25)}, 0, Inf) #x ~ HC(25)
is.proper(function(x) {dunif(x,0,1)}, 0, 1) #x ~ U(0,1)
is.proper(function(x) {dunif(x,-Inf,Inf)}, -Inf, Inf) #x ~ U(-Inf,Inf)
### Joint Posterior Distribution
##This assumes that Fit is an object of class demonoid, iterquad,
##  laplace, or pmc
#is.proper(Fit)



