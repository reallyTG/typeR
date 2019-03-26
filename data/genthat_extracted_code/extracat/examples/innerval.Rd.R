library(extracat)


### Name: innerval
### Title: Interval boundaries
### Aliases: innerval

### ** Examples

x1 <- rnorm(200)
innerval(x1)
quantile(x1, c(0.025, 0.975))


x2 <- rexp(200)
innerval(x2, data.points = FALSE)
innerval(x2)
quantile(x2, c(0.025, 0.975))




