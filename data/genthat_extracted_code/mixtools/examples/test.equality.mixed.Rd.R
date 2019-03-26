library(mixtools)


### Name: test.equality.mixed
### Title: Performs Chi-Square Test for Mixed Effects Mixtures
### Aliases: test.equality.mixed
### Keywords: file

### ** Examples

##Test of equal variances in the simulated data set.

data(RanEffdata)
set.seed(100)
x<-lapply(1:length(RanEffdata), function(i) 
          matrix(RanEffdata[[i]][, 2:3], ncol = 2))
x<-x[1:15]
y<-lapply(1:length(RanEffdata), function(i) 
          matrix(RanEffdata[[i]][, 1], ncol = 1))
y<-y[1:15]

out<-test.equality.mixed(y, x, arb.R = TRUE, arb.sigma = FALSE,
                         epsilon = 1e-1,  verb = TRUE,
                         maxit = 50,
                         addintercept.random = FALSE)
out



