library(extremefit)


### Name: predict.hill.ts
### Title: Predict the adaptive survival or quantile function for a time
###   serie
### Aliases: predict.hill.ts

### ** Examples

#Generate a pareto mixture sample of size n with a time varying parameter
theta <- function(t){
   0.5+0.25*sin(2*pi*t)
 }
n <- 4000
t <- 1:n/n
Theta <- theta(t)
Data <- NULL
set.seed(1240)
for(i in 1:n){
   Data[i] <- rparetomix(1, a = 1/Theta[i], b = 1/Theta[i]+5, c = 0.75, precision = 10^(-5))
 }
## Not run: 
##D  #For computing time purpose
##D   #choose the bandwidth by cross validation
##D   Tgrid <- seq(0, 1, 0.1)#few points to improve the computing time
##D   hgrid <- bandwidth.grid(0.01, 0.2, 20, type = "geometric")
##D   hcv <- bandwidth.CV(Data, t, Tgrid, hgrid, TruncGauss.kernel,
##D          kpar = c(sigma = 1), pcv = 0.99, CritVal = 3.6, plot = TRUE)
##D   h.cv <- hcv$h.cv
##D 
##D   #we modify the Tgrid to cover the data set
##D   Tgrid <- seq(0, 1, 0.02)
##D   hillTs <- hill.ts(Data, t, Tgrid, h = h.cv, TruncGauss.kernel, kpar = c(sigma = 1),
##D            CritVal = 3.6, gridlen = 100, initprop = 1/10, r1 = 1/4, r2 = 1/20)
##D   p <- c(0.999)
##D   pred.quantile.ts <- predict(hillTs, newdata = p, type = "quantile")
##D   true.quantile <- NULL
##D   for(i in 1:n){
##D      true.quantile[i] <- qparetomix(p, a = 1/Theta[i], b = 1/Theta[i]+5, c = 0.75)
##D    }
##D   plot(Tgrid, log(as.numeric(pred.quantile.ts$y)),
##D        ylim = c(0, max(log(as.numeric(pred.quantile.ts$y)))), ylab = "log(0.999-quantiles)")
##D   lines(t, log(true.quantile), col = "red")
##D   lines(t, log(Data), col = "blue")
##D 
##D 
##D   #comparison with other fixed bandwidths
##D 
##D   plot(Tgrid, log(as.numeric(pred.quantile.ts$y)),
##D        ylim = c(0, max(log(as.numeric(pred.quantile.ts$y)))), ylab = "log(0.999-quantiles)")
##D   lines(t, log(true.quantile), col = "red")
##D 
##D   hillTs <- hill.ts(Data, t, Tgrid, h = 0.1, TruncGauss.kernel, kpar = c(sigma = 1),
##D                     CritVal = 3.6, gridlen = 100,initprop = 1/10, r1 = 1/4, r2 = 1/20)
##D   pred.quantile.ts <- predict(hillTs, p, type = "quantile")
##D   lines(Tgrid, log(as.numeric(pred.quantile.ts$y)), col = "green")
##D 
##D 
##D   hillTs <- hill.ts(Data, t, Tgrid, h = 0.3, TruncGauss.kernel, kpar = c(sigma = 1),
##D                CritVal = 3.6, gridlen = 100, initprop = 1/10, r1 = 1/4, r2 = 1/20)
##D   pred.quantile.ts <- predict(hillTs, p, type = "quantile")
##D   lines(Tgrid, log(as.numeric(pred.quantile.ts$y)), col = "blue")
##D 
##D 
##D   hillTs <- hill.ts(Data, t, Tgrid, h = 0.04, TruncGauss.kernel, kpar = c(sigma = 1),
##D              CritVal = 3.6, gridlen = 100, initprop = 1/10, r1 = 1/4, r2 = 1/20)
##D   pred.quantile.ts <- predict(hillTs ,p, type = "quantile")
##D   lines(Tgrid, log(as.numeric(pred.quantile.ts$y)), col = "magenta")
## End(Not run)






