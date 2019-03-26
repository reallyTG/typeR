library(qgam)


### Name: qdo
### Title: Manipulating the output of 'mqgam'
### Aliases: qdo

### ** Examples

library(qgam); library(MASS)

quSeq <- c(0.4, 0.6)
set.seed(737)
fit <- mqgam(accel~s(times, k=20, bs="ad"), data = mcycle, err = 0.05, qu = quSeq, 
             control = list("tol" = 0.01)) # <- semi-sloppy tolerance to speed-up calibration 

qdo(fit, 0.4, summary)
invisible(qdo(fit, 0.4, plot, pages = 1))

# Return the object for qu = 0.6 and then plot it
tmp <- qdo(fit, 0.6)
plot(tmp)




