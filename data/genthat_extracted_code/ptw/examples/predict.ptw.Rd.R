library(ptw)


### Name: predict.ptw
### Title: Prediction of warped signals
### Aliases: predict.ptw
### Keywords: manip

### ** Examples

## educational example, contributed by zeehio (Sergio Oller)
x1 <- c(rep(0, 5), 1,1,1, 20, 40, 20, 1, 1, 1, rep(0, 5))
x2 <- c(rep(0, 6), 1,1,1, 20, 40, 20, 1, 1, 1, rep(0, 4))
time <- 1:length(x1)
## get time-warped object. Default: 'forward' warping, also works
## with backward warping
w1b <- ptw(ref = x1, samp = x2) 
## predict intensities of object x2 after warping at the times used in x1
x2wb <- predict(w1b, newdata = x2, what = "response")
## predict times where the original elements of x2 will end up
t2wb <- as.numeric(predict(w1b, newdata = time, what = "time"))

graphics.off()
par(mfrow = c(2,1))
plot(x1, type = "h", col = 2, lwd = 2, main = "Orig data")
points(x2, type = "h", col = 4)

plot(x1, type = "h", col = 2, lwd = 2, main = "Backward warping")
points(c(x2wb), type = "h", col = 4) # what = "response"
points(t2wb, x2, col = 4)            # what = "time"

## more relevant example
data(gaschrom)
## Global warping: all samples warped with the same function
ref <- gaschrom[1,]
samp <- gaschrom[14:16,]
gp <- ptw(ref, samp, init.coef = c(0, 1), warp.type = "global")
matplot(t(samp), type = "l", xlim = c(2200, 2400), lty = 1, col = 1:3)
lines(ref, type = "l", col = "gray", lwd = 2)
## plot predicted warped signal directly
matlines(t(predict(gp)), lty = 2, col = 1:3)
## plot original signal at warped time axis
matlines(t(predict(gp, newdata = 2001:2600, what = "time")),
         t(samp[,2001:2600]), col = 1:3, lwd = 3, lty = 2) ## OK
## result: good alignment with ref, differences between three profiles persist

## Individual warping: all samples warped individually
gp <- ptw(ref, samp, init.coef = c(0, 1), warp.type = "indiv")
predict(gp, what = "time", newdata = 2001:2600)
matplot(t(samp), type = "l", xlim = c(2200, 2400), lty = 1, col = 1:3)
lines(ref, type = "l", col = "gray", lwd = 2)
matlines(t(predict(gp, what = "time")),
         t(samp), col = 1:3, lty = 2)
## result: each individual profile is aligned to the ref

## How would samples 11:13 be warped using the coefficients from samples
## 14:16 (silly but just to make the point)?
samp.pred <- predict(gp, what = "response", newdata = gaschrom[11:13,])



