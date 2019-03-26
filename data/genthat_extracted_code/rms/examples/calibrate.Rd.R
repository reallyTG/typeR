library(rms)


### Name: calibrate
### Title: Resampling Model Calibration
### Aliases: calibrate calibrate.default calibrate.cph calibrate.psm
###   print.calibrate print.calibrate.default plot.calibrate
###   plot.calibrate.default
### Keywords: methods models regression survival hplot

### ** Examples

set.seed(1)
n <- 200
d.time <- rexp(n)
x1 <- runif(n)
x2 <- factor(sample(c('a', 'b', 'c'), n, TRUE))
f <- cph(Surv(d.time) ~ pol(x1,2) * x2, x=TRUE, y=TRUE, surv=TRUE, time.inc=1.5)
#or f <- psm(S ~ ...)
pa <- 'polspline' %in% row.names(installed.packages())
if(pa) {
 cal <- calibrate(f, u=1.5, B=20)  # cmethod='hare'
 plot(cal)
}
cal <- calibrate(f, u=1.5, cmethod='KM', m=50, B=20)  # usually B=200 or 300
plot(cal, add=pa)

set.seed(1)
y <- sample(0:2, n, TRUE)
x1 <- runif(n)
x2 <- runif(n)
x3 <- runif(n)
x4 <- runif(n)
f <- lrm(y ~ x1 + x2 + x3 * x4, x=TRUE, y=TRUE)
cal <- calibrate(f, kint=2, predy=seq(.2, .8, length=60), 
                 group=y)
# group= does k-sample validation: make resamples have same 
# numbers of subjects in each level of y as original sample

plot(cal)
#See the example for the validate function for a method of validating
#continuation ratio ordinal logistic models.  You can do the same
#thing for calibrate



