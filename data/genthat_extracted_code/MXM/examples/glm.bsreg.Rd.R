library(MXM)


### Name: Backward selection with generalised linear regression models
### Title: Variable selection in generalised linear regression models with
###   backward selection
### Aliases: glm.bsreg gammabsreg normlog.bsreg
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix( runif(100 * 10, 1, 100), ncol = 10 )

#define a simulated class variable 
target <- rpois(100, 10)
a <- glm.bsreg(target, dataset, threshold = 0.05) 

target <- rbinom(100, 1, 0.6)
b <- glm.bsreg(target, dataset, threshold = 0.05)

target <- rgamma(100, 1, 2)
b1 <- gammabsreg(target, dataset, threshold = 0.05)
b2 <- normlog.bsreg(target, dataset, threshold = 0.05)



