library(ffstream)


### Name: initAFFMeanCD
### Title: Initialisation of AFF change detector
### Aliases: initAFFMeanCD

### ** Examples

library(Rcpp)
affmeancd1 <- initAFFMeanCD()              # initialises with alpha=0.01, 
                                           # eta=0.01 and BL=50

affmeancd2 <- initAFFMeanCD(alpha=0.005, eta=0.1,  BL=100) 


affmeancd3 <- initAFFMeanCD(alpha=0.005, eta=0.1,  BL=0)     # Example 3
affmeancd3$streamEstMean <- 0
affmeancd3$streamEstSigma <- 1





