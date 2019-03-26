library(VarSelLCM)


### Name: ARI
### Title: Adjusted Rand Index
### Aliases: ARI

### ** Examples

x <- sample(1:2, 20, replace=TRUE)
y <- x
y[1:5] <- sample(1:2, 5, replace=TRUE)
ARI(x, y)



