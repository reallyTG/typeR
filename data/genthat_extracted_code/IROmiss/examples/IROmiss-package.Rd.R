library(IROmiss)


### Name: IROmiss-package
### Title: Imputation Regularized Optimization Algorithm
### Aliases: IROmiss-package
### Keywords: package

### ** Examples

    ## No test: 
library(IROmiss)
p <- 200
beta <- rep(0,p)
beta[1:5] <- c(1, 2, -1.5, -2.5, 5)
result <- SimRegDat(n = 100, p = 200, coef = beta, data.type = "indep",
miss.type="MCAR", rate = 0.05)
RegICRO(result$x, result$y, result$coef, type = "indep", iteration = 30, warm = 20)
      
## End(No test)



