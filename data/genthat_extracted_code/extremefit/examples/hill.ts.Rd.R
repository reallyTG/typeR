library(extremefit)


### Name: hill.ts
### Title: Compute the extreme quantile procedure on a time dependent data
### Aliases: hill.ts print.hill.ts

### ** Examples


theta <- function(t){
   0.5+0.25*sin(2*pi*t)
 }
n <- 5000
t <- 1:n/n
Theta <- theta(t)
Data <- NULL
Tgrid <- seq(0.01, 0.99, 0.01)
#example with fixed bandwidth
## Not run: 
##D  #For computing time purpose
##D   for(i in 1:n){
##D      Data[i] <- rparetomix(1, a = 1/Theta[i], b = 5/Theta[i]+5, c = 0.75, precision = 10^(-5))
##D    }
##D 
##D   #example
##D   hgrid <- bandwidth.grid(0.009, 0.2, 20, type = "geometric")
##D   TgridCV <- seq(0.01, 0.99, 0.1)
##D   hcv <- bandwidth.CV(Data, t, TgridCV, hgrid, pcv = 0.99, TruncGauss.kernel,
##D                      kpar = c(sigma = 1), CritVal = 3.6, plot = TRUE)
##D 
##D   Tgrid <- seq(0.01, 0.99, 0.01)
##D   hillTs <- hill.ts(Data, t, Tgrid, h = hcv$h.cv, kernel = TruncGauss.kernel,
##D              kpar = c(sigma = 1), CritVal = 3.6,gridlen = 100, initprop = 1/10, r1 = 1/4, r2 = 1/20)
##D   plot(hillTs$Tgrid, hillTs$Theta, xlab = "t", ylab = "Estimator of theta")
##D   lines(t, Theta, col = "red")
##D 
## End(Not run)





