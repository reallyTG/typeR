library(cardidates)


### Name: summary.cardiFit
### Title: Summary Method for cardiFit Objects
### Aliases: summary.cardiFit
### Keywords: methods

### ** Examples

## create some test data
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)

## fit Weibull function with 6 free parameters
res <- fitweibull6(x, y)

## see the results
plot(res)
summary(res)



