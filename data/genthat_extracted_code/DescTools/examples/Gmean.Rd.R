library(DescTools)


### Name: Gmean
### Title: Geometric Mean and Standard Deviation
### Aliases: Gmean Gsd
### Keywords: arith

### ** Examples

x <- runif(5)
Gmean(x)

m <- matrix(runif(50), nrow = 10)
apply(m, 2, Gmean)

sapply(as.data.frame(m), Gmean)



