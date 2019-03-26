library(distrTEst)


### Name: Evaluation-class
### Title: Class "Evaluation"
### Aliases: Evaluation-class initialize,Evaluation-method
### Keywords: manip

### ** Examples

N <- Norm() # N is a standard normal distribution.
C <- Cauchy() # C is a Cauchy distribution
cs <- Contsimulation(filename = "csim",
                     runs = 5,
                     samplesize=5000,
                     seed=setRNG(),
                     distribution.id = N,
                     distribution.c = C,
                     rate = 0.1)
simulate(cs)
# Each of the 25000 random numbers is ideal (N-distributed) with
# probability 0.9 and contaminated (C-distributed) with probability = 0.1
summary(cs)
ev1 <- evaluate(cs, mean, resname="mean") # estimates the data with mean
ev1 # bad results
ev2 <- evaluate(cs,median, resname="median") # estimates the data with median
ev2 # better results because median is robust
savedata(ev1)
# saves the evaluation with result as "csim.mean" and without result as
# "csim.mean.comment" in the working directory # of R - "csim" is the
# filename of the Contsimulation object, mean the name of the estimator
rm(ev1)
cload("csim.mean")
# loads the evaluation without result - the object is called ev1.comment
ev1.comment
load("csim.mean") # loads the evaluation with result
ev1
plot(ev1)
#
#another function to be evaluated:
severalThings<- function(x) {list("mean"=mean(x),"sd"=sd(as.vector(x)), "mad"=mad(x))}
ev3 <- evaluate(cs, severalThings, resname="several") 
plot(ev3)
plot(ev3, ylim=c(0,10), col=c("blue","green", "red"))



