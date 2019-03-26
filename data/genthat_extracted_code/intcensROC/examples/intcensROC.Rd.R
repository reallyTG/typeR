library(intcensROC)


### Name: intcensROC
### Title: Compute the ROC curves for Interval Censored Survival Data
### Aliases: intcensROC

### ** Examples

## example data
U <- runif(100, min = 0.1, max = 5)
V <- runif(100, min = 0.1, max = 5) + U
Marker <- runif(100, min = 5, max = 10)
Delta  <- sample.int(3, size = 100, replace = TRUE)
pTime <- 4

## compute the ROC curve
res <- intcensROC(U, V, Marker, Delta, pTime, gridNumber = 500)
head(res)



