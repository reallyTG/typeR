library(EvoRAG)


### Name: expectation.time
### Title: calculate the expected (i.e. mean) Euclidean distances through
###   time given a rate of evolution, Beta.
### Aliases: expectation.time
### Keywords: Expectation

### ** Examples

##Example 1
  ###Compare data simulated under BM_null to the expectation and quantiles
  TIME = c(0:100) * 0.1
  GRAD = (0:100)*0 #BM_null does not require GRAD, thus simply make a dummy set of GRAD
  DATA1 <- sim.sisters(TIME=TIME, GRAD=GRAD, parameters = c(0.1), 
     model=c("BM_null"), MULT=10)
  expectation.time(Beta=0.1, Alpha="NULL", time.span=c(0, 10), values=FALSE, 
     plot=TRUE, quantile=TRUE)
  points(DATA1[,3] ~ DATA1[,2], col="black", cex=0.4)

##Example 2
  ###Compare data simulated under OU_null to the expectation and quantiles
  TIME = c(0:100) * 0.1
  GRAD = (0:100)*0 #GRAD is not required by these models, so a dummy set of GRAD are provided
  DATA1 <- sim.sisters(TIME=TIME, GRAD=GRAD, parameters = c(0.1, 1), 
     model=c("OU_null"), MULT=10)
  expectation.time(Beta=0.1, Alpha=1, time.span=c(0, 10), values=FALSE, 
     plot=TRUE, quantile=TRUE)
  points(DATA1[,3] ~ DATA1[,2], col="black", cex=0.4)



