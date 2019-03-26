library(MXM)


### Name: Conditional independence tests for left censored data 
### Title: Conditional independence test for survival data
### Aliases: testIndTobit waldTobit permTobit
### Keywords: Survival Tobit regression Log likelihood ratio Conditional
###   independence test

### ** Examples

require(survival, quietly = TRUE)

x <- matrix( rnorm(100 * 30), ncol = 30)
y <- x[, 1] - x[, 2] + rnorm(100, 5)
y[y < 0 ] <- 0
y <- Surv(y, y>0, type = 'left') 
  
#run the censIndCR   conditional independence test
testIndTobit(y, x, xIndex = 12, csIndex = c(5, 7, 4) )
waldTobit(y, x, xIndex = 12, csIndex = c(5, 7, 4) )
permTobit(y, x, xIndex = 12, csIndex = c(5, 7, 4), R = 499 )
  
#run the SES algorithm using the censIndCR conditional independence
#test for the survival class variable
a <- SES(y, x, max_k = 2, threshold = 0.05, test = "testIndTobit");



