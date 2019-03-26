library(hctrial)


### Name: hist_start
### Title: Initializes a design based on historical controls before the
###   start of the study.
### Aliases: hist_start

### ** Examples

X <- abs(rnorm(1000, 0, 1))
Y <- rbinom(1000, 1, 1-exp(-X))
mydata <- data.frame("X" = X, "Y" = Y)
hist_start(mydata, Y~X, c1 = 2)



