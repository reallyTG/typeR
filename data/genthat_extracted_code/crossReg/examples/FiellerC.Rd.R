library(crossReg)


### Name: FiellerC
### Title: Confidence intervals for crossover points using the Fieller
###   method
### Aliases: FiellerC

### ** Examples

# example data
library(MASS)
out <- mvrnorm(1000, mu = c(0,0), Sigma = matrix(c(1,0.2,0.2,1), ncol = 2),empirical = TRUE)
x1 <- out[,1]
x2 <- out[,2]
epsilon <-rnorm(1000,0,1)
y <- 1 + 1*x1 + 0.5*x2 + 1*x1*x2 + epsilon  # true C = -0.5/1 = -0.5
simData <- data.frame(y=y,x1=x1,x2=x2)

# run FiellerC()
FiellerC(simData)



