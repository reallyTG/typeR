library(coxphw)


### Name: plot.coxphw.predict
### Title: Plot the Relative or Log Relative Hazard Versus Values of a
###   Continuous Covariable.
### Aliases: plot.coxphw.predict
### Keywords: survival

### ** Examples

set.seed(30091)
n <- 300
x <- 1:n
true.func <- function(x) 3 * (x / 100)^{2} - log(x / 100) - 3 * x / 100
x <- round(rnorm(n = x) * 10 + 40, digits = 0)
time <- rexp(n = n, rate = 1) / exp(true.func(x))
event <- rep(x = 1, times = n)
futime <- runif(n = n, min = 0, max = 309000)
event <- (time < futime) + 0
time[event == 0] <- futime[event == 0]
my.data <- data.frame(x, time, event)

fitahr <- coxphw(Surv(time, event) ~ x, data = my.data, template = "AHR")

# estimated function
plotx <- quantile(x, probs = 0.05):quantile(x, probs = 0.95)
plot(predict(fitahr, type = "shape", newx = plotx, refx = median(x), x = "x",
             verbose = FALSE))

# true function
lines(x = plotx, true.func(plotx) - true.func(median(plotx)), lty = 2)

legend("topright", legend=c("AHR estimates", "true"), bty = "n", lty = 1:2, inset = 0.05)

# for more examples see predict.coxphw



