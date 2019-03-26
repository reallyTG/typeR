library(pmr)


### Name: wdbm
### Title: Weighted Distance-based Models
### Aliases: wdbm
### Keywords: weighted distance-base models

### ** Examples

## create an artificial dataset
X1 <- c(1,1,2,2,3,3)
X2 <- c(2,3,1,3,1,2)
X3 <- c(3,2,3,1,2,1)
n <- c(6,5,4,3,2,1)
test <- data.frame(X1,X2,X3,n)

## fit the weighted distance-based model with Spearman's foot distance
## wdbm(test,dtype="foot")



