library(DescTools)


### Name: Hmean
### Title: Harmonic Mean and Its Confidence Interval
### Aliases: Hmean
### Keywords: arith

### ** Examples

x <- runif(5)
Hmean(x)

m <- matrix(runif(50), nrow = 10)
apply(m, 2, Hmean)

sapply(as.data.frame(m), Hmean)



