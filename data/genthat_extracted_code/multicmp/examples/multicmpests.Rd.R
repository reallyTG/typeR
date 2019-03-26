library(multicmp)


### Name: multicmpests
### Title: Bivariate COM-Poisson Parameter Estimation
### Aliases: multicmpests

### ** Examples

    x1 <- c(3,2,5,4,1)
    x2 <- c(0,4,1,0,1)
    ex.data <- cbind(x1,x2)
    
    # starting close to the optimum for sake of run time
    multicmpests(ex.data, startvalues = c(12.5 , 1.7 , 0, 0.25, 0.75, 0)) 




