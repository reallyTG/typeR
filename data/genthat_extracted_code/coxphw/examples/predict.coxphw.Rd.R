library(coxphw)


### Name: predict.coxphw
### Title: Predictions for a weigthed Cox model
### Aliases: predict.coxphw
### Keywords: survival

### ** Examples

### Example for type = "slice.time"
data("gastric")
gastric$yrs <- gastric$time / 365.25

# check proportional hazards
fitcox <- coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastric, x = TRUE,
                method = "breslow")
fitcox.ph <- cox.zph(fit = fitcox, transform = "identity")


## compare and visualize linear and log-linear time-dependent effects of radiation
fit1 <- coxphw(Surv(yrs, status) ~ yrs * radiation, data = gastric, template = "PH")
summary(fit1)

predict(fit1, type = "slice.time", x = "yrs", z = "radiation", newx = c(0.5, 1, 2),
        verbose = TRUE, exp = TRUE, pval = TRUE)


fit2 <- coxphw(Surv(yrs, status) ~ log(yrs) * radiation, data = gastric, template = "PH")
summary(fit2)

predict(fit2, type = "slice.time", x = "yrs", z = "radiation", newx = c(0.5, 1, 2),
        verbose = TRUE, exp = TRUE, pval = TRUE)


plotx <- seq(from = quantile(gastric$yrs, probs = 0.05),
             to = quantile(gastric$yrs, probs = 0.95), length = 100)
y1 <- predict(fit1, type = "slice.time", x = "yrs", z = "radiation", newx = plotx)
y2 <- predict(fit2, type = "slice.time", x = "yrs", z = "radiation", newx = plotx)

plot(x = fitcox.ph, se = FALSE, xlim = c(0, 3), las = 1, lty = 3)
abline(a = 0, b = 0, lty = 3)
lines(x = plotx, y = y1$estimates[, "coef"], col = "red", lty = 1, lwd = 2)
lines(x = plotx, y = y2$estimates[, "coef"], col = "blue", lty = 2, lwd = 2)
legend(x = 1.7, y = 1.6, title = "time-dependent effect", title.col = "black",
       legend = c("LOWESS", "linear", "log-linear"), col = c("black", "red", "blue"),
       lty = c(3, 1:2), bty = "n", lwd = 2, text.col = c("black", "red", "blue"))



### Example for type = "shape"
set.seed(512364)
n <- 200
x <- 1:n
true.func <- function(x) 2.5 * log(x) - 2
x <- round(runif(x) * 60 + 10, digits = 0)
time <- round(100000 * rexp(n= n, rate = 1) / exp(true.func(x)), digits = 1)
event <- rep(x = 1, times = n)
my.data <- data.frame(x,time,event)

fit <- coxphw(Surv(time, event) ~ log(x) + x, data = my.data, template = "AHR")

predict(fit, type = "shape", newx = c(30, 50), refx = 40, x = "x", verbose = TRUE)

plotx <- seq(from = quantile(x, probs = 0.05),
             to = quantile(x, probs = 0.95), length = 100)
plot(predict(fit, type = "shape", newx = plotx, refx = 40, x = "x"))


### Example for type = "slice.x" and "slice.z"
set.seed(75315)
n <- 200
trt <- rbinom(n = n, size = 1, prob = 0.5)
x <- 1:n
true.func <- function(x) 2.5 * log(x) - 2
x <- round(runif(n = x) * 60 + 10, digits = 0)
time <- 100 * rexp(n = n, rate = 1) / exp(true.func(x) /
                                      4 * trt - (true.func(x) / 4)^2 * (trt==0))
event <- rep(x = 1, times = n)
my.data <- data.frame(x, trt, time, event)

fun<-function(x) x^(-2)
fit <- coxphw(Surv(time, event) ~ x * trt + fun(x) * trt , data = my.data,
              template = "AHR", verbose = FALSE)

# plots the interaction of trt with x (the effect of trt dependent on the values of x)
plotx <- quantile(x, probs = 0.05):quantile(x, probs = 0.95)
plot(predict(fit, type = "slice.x", x = "x", z = "trt",
             newx = plotx, verbose = FALSE), main = "interaction of trt with x")

# plot the effect of x in subjects with trt = 0
y0 <- predict(fit, type = "slice.z", x = "x", z = "trt", at = 0, newx = plotx,
              refx = median(x), verbose = FALSE)
plot(y0, main = "effect of x in subjects with trt = 0")


# plot the effect of x in subjects with trt = 1
y1 <- predict(fit, type = "slice.z", x = "x", z = "trt", at = 1, newx = plotx,
              refx = median(x), verbose = FALSE)
plot(y1, main = "effect of x in subjects with trt = 1")


# Example for type = "slice.time"
set.seed(23917)
time <- 100 * rexp(n = n, rate = 1) / exp((true.func(x) / 10)^2 / 2000 * trt + trt)
event <- rep(x = 1, times = n)
my.data <- data.frame(x, trt, time, event)
plot.x <- seq(from = 1, to = 100, by = 1)

fun  <- function(t) { PT(t)^-2 * log(PT(t)) }
fun2 <- function(t) { PT(t)^-2 }
fitahr <- coxphw(Surv(time, event) ~ fun(time) * trt + fun2(time) * trt + x,
                 data = my.data, template = "AHR")
yahr <- predict(fitahr, type = "slice.time", x = "time", z = "trt", newx = plot.x)

fitph <- coxphw(Surv(time, event) ~ fun(time) * trt + fun2(time) * trt + x,
                data = my.data, template = "PH")
yph <- predict(fitph, type = "slice.time", x = "time", z = "trt", newx = plot.x)

plot(yahr, addci = FALSE)
lines(yph$estimates$time, yph$estimates$coef, lty = 2)
legend("bottomright", legend = c("AHR", "PH"), bty = "n", lty = 1:2,
       inset = 0.05)



