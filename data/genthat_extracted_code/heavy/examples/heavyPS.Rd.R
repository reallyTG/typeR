library(heavy)


### Name: heavyPS
### Title: Fit a penalized spline under heavy-tailed distributions
### Aliases: heavyPS
### Keywords: smooth

### ** Examples

data(life)
x <- life$income
y <- life$life
fit <- heavyPS(x, y, family = Student(df = 5), method = "GCV")
summary(fit)
par(pty = "s")
plot(x, y, xlab = "Per Capita Income", ylab = "Life Expectancy")
lines(fit$xgrid, fit$ygrid)



