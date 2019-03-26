library(IROmiss)


### Name: RegICRO
### Title: Variable selection for high-dimensional Regression with Missing
###   Data.
### Aliases: RegICRO
### Keywords: RegICRO

### ** Examples

      ## Don't show: 
library(IROmiss)
p <- 50
beta <- rep(0,p)
beta[1:5] <- c(1, 2, -1.5, -2.5, 5)
result <- SimRegDat(n = 100, p = 50, coef = beta, data.type = "indep",
miss.type="MAR", rate = 0.05)
RegICRO(result$x, result$y, result$coef, type = "indep", iteration = 10, warm = 5)
      
## End(Don't show)
    ## No test: 
library(IROmiss)
p <- 200
beta <- rep(0,p)
beta[1:5] <- c(1, 2, -1.5, -2.5, 5)
result <- SimRegDat(n = 100, p = 200, coef = beta, data.type = "indep", 
miss.type="MAR", rate = 0.05)
RegICRO(result$x, result$y, result$coef, type = "indep", iteration = 20, warm = 10)
      
## End(No test)



