library(Hmisc)


### Name: somers2
### Title: Somers' Dxy Rank Correlation
### Aliases: somers2
### Keywords: nonparametric

### ** Examples

set.seed(1)
predicted <- runif(200)
dead      <- sample(0:1, 200, TRUE)
roc.area <- somers2(predicted, dead)["C"]

# Check weights
x <- 1:6
y <- c(0,0,1,0,1,1)
f <- c(3,2,2,3,2,1)
somers2(x, y)
somers2(rep(x, f), rep(y, f))
somers2(x, y, f)



