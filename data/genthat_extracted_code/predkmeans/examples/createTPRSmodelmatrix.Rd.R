library(predkmeans)


### Name: createTPRSmodelmatrix
### Title: Create matrix of Thin-Plate Regression Splines (TPRS)
### Aliases: createTPRSmodelmatrix

### ** Examples

n <- 200
x <- runif(n=n, 0, 100)
y <- runif(n=n, 0, 100)
d <- data.frame(x=x, y=y)
mx <- createTPRSmodelmatrix(data=d, df=5)



