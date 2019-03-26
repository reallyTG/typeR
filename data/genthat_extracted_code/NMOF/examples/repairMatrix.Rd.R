library(NMOF)


### Name: repairMatrix
### Title: Repair an Indefinite Correlation Matrix
### Aliases: repairMatrix

### ** Examples

## example: build a portfolio of three assets
C <- c(1,.9,.9,.9,1,.2,.9,.2,1)
dim(C) <- c(3L, 3L)
eigen(C, only.values = TRUE)

vols <- c(.3, .3, .3)      ## volatilities
S <- C * outer(vols,vols)  ## covariance matrix
w <- c(-1, 1, 1)           ## a portfolio
w %*% S %*% w          ## variance of portfolio is negative!
sqrt(as.complex(w %*% S %*% w))

S <- repairMatrix(C) * outer(vols,vols)
w %*% S %*% w          ## more reasonable
sqrt(w %*% S %*% w)



