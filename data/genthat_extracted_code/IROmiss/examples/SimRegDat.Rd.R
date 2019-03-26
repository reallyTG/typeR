library(IROmiss)


### Name: SimRegDat
### Title: Simulate Incomplete Data for High-Dimensional Linear Regression.
### Aliases: SimRegDat
### Keywords: SimRegDat

### ** Examples

library(IROmiss)
p <- 200
beta <- rep(0,p)
beta[1:5] <- c(1, 2, -1.5, -2.5, 5)
SimRegDat(n = 100, p = 200, coef = beta, data.type = "dep", 
miss.type="MAR", rate = 0.1)
         



