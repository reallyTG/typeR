library(McSpatial)


### Name: matchprop
### Title: Matched sample data frame based on propensity scores
### Aliases: matchprop
### Keywords: Matching

### ** Examples


set.seed(189)
n = 1000
x <- rnorm(n)
x <- sort(x)
y <- x*1 + rnorm(n, 0, sd(x)/2)
y <- ifelse(y>0,1,0)
table(y)
fit <- matchprop(y~x,m.order="largest",ytreat=1)
table(fit$y)




