library(crossReg)


### Name: nonLinearC
### Title: Confidence intervals for crossover points using non-linear
###   regression
### Aliases: nonLinearC

### ** Examples

# set initial values for non-linear regression 
startingValue <- list(A0 = 1, B1 = 1, B2 = 1, C = 1)  

# example data
library(MASS)
out <- mvrnorm(1000, mu = c(0,0), Sigma = matrix(c(1,0.2,0.2,1), ncol = 2),empirical = TRUE)
x1 <- out[,1]
x2 <- out[,2]
epsilon <-rnorm(1000,0,1)
y <- 1 + 1*x1 + 0.5*x2 + 1*x1*x2 + epsilon  # true C = -0.5/1 = -0.5
simData <- data.frame(y=y,x1=x1,x2=x2)

# run nonLinearC()
nonLinearC(simData, startingValue)



