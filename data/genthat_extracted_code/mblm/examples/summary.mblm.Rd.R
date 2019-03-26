library(mblm)


### Name: summary.mblm
### Title: Summarizing median-based linear models
### Aliases: summary.mblm
### Keywords: models

### ** Examples


set.seed(1234)
x <- 1:10+rnorm(10)
y <- x+rnorm(10)
y[10] <- 20
fit <- mblm(y~x)
summary(fit)




