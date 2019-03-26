library(dyncomp)


### Name: complexity
### Title: Calculate dynamic complexity of time series
### Aliases: complexity
### Keywords: ~kwd1 ~kwd2

### ** Examples

t <- runif(100, 0, 10)
c <- complexity(x = t, scaleMin = 0, scaleMax = 10, width = 5, measure = "complexity",
rescale = TRUE)
plot(t, type = "l")
lines(c, col = "red", lty = 4)



