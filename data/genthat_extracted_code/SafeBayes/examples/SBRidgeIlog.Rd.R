library(SafeBayes)


### Name: SBRidgeIlog
### Title: I-log-Safe-Bayesian Ridge Regression
### Aliases: SBRidgeIlog
### Keywords: SafeBayes

### ** Examples

rm(list=ls())
# Simulate data
x <- runif(10, -1, 1) # 10 random uniform x's between -1 and 1
y <- NULL

# for each x, an y that is 0 + Gaussian noise
for (i in 1:10) {
  y[i] <-  0 + rnorm(1, mean=0, sd=1/4) 
  }

plot(x,y)

## Not run: 
##D # Let I-log-SafeBayes learn the learning rate 
##D sbobj <- SBRidgeIlog(y, x, etaseq=c(1, 0.5, 0.25))
##D 
##D # eta 
##D sbobj$eta.min
## End(Not run)




