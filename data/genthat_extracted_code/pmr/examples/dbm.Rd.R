library(pmr)


### Name: dbm
### Title: Distance-based Models
### Aliases: dbm
### Keywords: distance-based model

### ** Examples

library(pmr)
## create an artificial dataset
X1 <- c(1,1,2,2,3,3)
X2 <- c(2,3,1,3,1,2)
X3 <- c(3,2,3,1,2,1)
n <- c(6,5,4,3,2,1)
test <- data.frame(X1,X2,X3,n)

## fit the distance-based model with Spearman's rho distance
## dbm(test,dtype="rho")



