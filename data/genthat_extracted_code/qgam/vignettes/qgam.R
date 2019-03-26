## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center", tidy=FALSE)

## ----1, message = F------------------------------------------------------
library(qgam); library(MASS)
if( suppressWarnings(require(RhpcBLASctl)) ){ blas_set_num_threads(1) } # Optional

set.seed(6436)
fit <- qgam(accel~s(times, k=20, bs="ad"), 
            data = mcycle, 
            qu = 0.8, 
            err = 0.1)

# Plot the fit
xSeq <- data.frame(cbind("accel" = rep(0, 1e3), "times" = seq(2, 58, length.out = 1e3)))
pred <- predict(fit, newdata = xSeq, se=TRUE)
plot(mcycle$times, mcycle$accel, xlab = "Times", ylab = "Acceleration", ylim = c(-150, 80))
lines(xSeq$times, pred$fit, lwd = 1)
lines(xSeq$times, pred$fit + 2*pred$se.fit, lwd = 1, col = 2)
lines(xSeq$times, pred$fit - 2*pred$se.fit, lwd = 1, col = 2)   

## ----2-------------------------------------------------------------------
check(fit$calibr, 2)

## ----3, message = F------------------------------------------------------
set.seed(6436)
cal <- tuneLearn(accel~s(times, k=20, bs="ad"), 
                 data = mcycle, 
                 qu = 0.8,
                 err = 0.1,
                 lsig = seq(1, 3, length.out = 20), 
                 control = list("progress" = "none")) #<- sequence of values for learning rate
                 
check(cal)

## ----4-------------------------------------------------------------------
quSeq <- c(0.2, 0.4, 0.6, 0.8)
set.seed(6436)
fit <- mqgam(accel~s(times, k=20, bs="ad"), 
             data = mcycle, 
             err = 0.1,
             qu = quSeq)

## ----5-------------------------------------------------------------------
# Plot the data
xSeq <- data.frame(cbind("accel" = rep(0, 1e3), "times" = seq(2, 58, length.out = 1e3)))
plot(mcycle$times, mcycle$accel, xlab = "Times", ylab = "Acceleration", ylim = c(-150, 80))

# Predict each quantile curve and plot
for(iq in quSeq){
  pred <- qdo(fit, iq, predict, newdata = xSeq)
  lines(xSeq$times, pred, col = 2)
}

## ----6-------------------------------------------------------------------
# Summary for quantile 0.4
qdo(fit, qu = 0.4, summary)

## ----h1------------------------------------------------------------------
set.seed(651)
n <- 5000
x <- seq(-4, 3, length.out = n)
X <- cbind(1, x, x^2)
beta <- c(0, 1, 1)
sigma =  1.2 + sin(2*x)
f <- drop(X %*% beta)
dat <- f + rnorm(n, 0, sigma)
dataf <- data.frame(cbind(dat, x))
names(dataf) <- c("y", "x")
   
qus <- seq(0.05, 0.95, length.out = 10)
plot(x, dat, col = "grey", ylab = "y")
for(iq in qus){ lines(x, qnorm(iq, f, sigma)) }

## ----h2------------------------------------------------------------------
fit <- mqgam(y~s(x, k = 30, bs = "cr"), 
             data = dataf,
             qu = qus, err = 0.05)
             
qus <- seq(0.05, 0.95, length.out = 10)
plot(x, dat, col = "grey", ylab = "y")
for(iq in qus){ 
 lines(x, qnorm(iq, f, sigma), col = 2)
 lines(x, qdo(fit, iq, predict))
}
legend("top", c("truth", "fitted"), col = 2:1, lty = rep(1, 2))

## ----h3------------------------------------------------------------------
plot(x, dat, col = "grey", ylab = "y")
tmp <- qdo(fit, 0.95, predict, se = TRUE)
lines(x, tmp$fit)
lines(x, tmp$fit + 3 * tmp$se.fit, col = 2)
lines(x, tmp$fit - 3 * tmp$se.fit, col = 2)

## ----h4------------------------------------------------------------------
fit <- qgam(list(y~s(x, k = 30, bs = "cr"), ~ s(x, k = 30, bs = "cr")), 
            data = dataf, qu = 0.95, err = 0.05, lsig = 0.44)

plot(x, dat, col = "grey", ylab = "y")
tmp <- predict(fit, se = TRUE)
lines(x, tmp$fit[ , 1])
lines(x, tmp$fit[ , 1] + 3 * tmp$se.fit[ , 1], col = 2)
lines(x, tmp$fit[ , 1] - 3 * tmp$se.fit[ , 1], col = 2)

## ----c1------------------------------------------------------------------
library(qgam)
set.seed(15560)
n <- 1000
x <- rnorm(n, 0, 1); z <- rnorm(n)
X <- cbind(1, x, x^2, z, x*z)
beta <- c(0, 1, 1, 1, 0.5)
y <- drop(X %*% beta) + rnorm(n) 
dataf <- data.frame(cbind(y, x, z))
names(dataf) <- c("y", "x", "z")

## ----c2------------------------------------------------------------------
qu <- 0.5
fit <- qgam(y~x, qu = qu, data = dataf)
cqcheck(obj = fit, v = c("x"), X = dataf, y = y) 

## ----c3, message = F-----------------------------------------------------
fit <- qgam(y~s(x), qu = qu, data = dataf)
cqcheck(obj = fit, v = c("x"), X = dataf, y = y)

## ----c4, message = F-----------------------------------------------------
cqcheck(obj = fit, v = c("x", "z"), X = dataf, y = y, nbin = c(5, 5))

## ----c5, message = F-----------------------------------------------------
cqcheck(obj = fit, v = c("z"), X = dataf, y = y, nbin = c(10))

## ----c6, message = F-----------------------------------------------------
fit <- qgam(y~s(x)+z, qu = qu, data = dataf)
cqcheck(obj = fit, v = c("z"))

## ----c7, message = F-----------------------------------------------------
cqcheck(obj = fit, v = c("x", "z"), nbin = c(5, 5))

## ----c8, message = F-----------------------------------------------------
fit <- qgam(y~s(x)+z+I(x*z), qu = qu, data = dataf)
cqcheck(obj = fit, v = c("x", "z"), nbin = c(5, 5))

## ----c9, message = F-----------------------------------------------------
fit <- mqgam(y~s(x)+z+I(x*z), qu = c(0.2, 0.4, 0.6, 0.8), data = dataf)

## ----c10, message = F----------------------------------------------------
check.learnFast(fit$calibr, 2:5)

## ----c11, message = F----------------------------------------------------
qdo(fit, 0.2, check)

## ----edf1----------------------------------------------------------------
data("UKload")
tmpx <- seq(UKload$Year[1], tail(UKload$Year, 1), length.out = nrow(UKload)) 
plot(tmpx, UKload$NetDemand, type = 'l', xlab = 'Year', ylab = 'Load')

## ----edf2----------------------------------------------------------------
qu <- 0.5
form <- NetDemand~s(wM,k=20,bs='cr') + s(wM_s95,k=20,bs='cr') + 
        s(Posan,bs='ad',k=30,xt=list("bs"="cc")) + Dow + s(Trend,k=4) + NetDemand.48 + Holy

## ----edf3, message=FALSE-------------------------------------------------
set.seed(41241)
sigSeq <- seq(4, 8, length.out = 16)
closs <- tuneLearn(form = form, data = UKload, 
                   lsig = sigSeq, qu = qu, control = list("K" = 20), 
                   multicore = TRUE, ncores = 2, err = 0.1)

check(closs)

## ----edf4----------------------------------------------------------------
lsig <- closs$lsig
fit <- qgam(form = form, data = UKload, lsig = lsig, qu = qu, err = 0.1)
plot(fit, scale = F, page = 1)

## ----edf5----------------------------------------------------------------
par(mfrow = c(2, 2))
cqcheck(fit, v = c("wM"), main = "wM")
cqcheck(fit, v = c("wM_s95"), main = "wM_s95")
cqcheck(fit, v = c("Posan"), main = "Posan")
cqcheck(fit, v = c("Trend"), main = "Trend", xaxt='n')
axis(1, at = UKload$Trend[c(1, 500, 1000, 1500, 2000)], 
             UKload$Year[c(1, 500, 1000, 1500, 2000)] )

## ----edf6----------------------------------------------------------------
par(mfrow = c(1, 1))
cqcheck(fit, v = c("wM", "Posan"), scatter = T)

