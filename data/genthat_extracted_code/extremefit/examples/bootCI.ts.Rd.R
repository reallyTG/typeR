library(extremefit)


### Name: bootCI.ts
### Title: Pointwise confidence intervals by bootstrap
### Aliases: bootCI.ts

### ** Examples

theta <- function(t){
   0.5+0.25*sin(2*pi*t)
 }
n <- 5000
t <- 1:n/n
Theta <- theta(t)
set.seed(123)
Data <- NULL
for(i in 1:n){
   Data[i] <- rparetomix(1, a = 1/Theta[i], b = 1/Theta[i]+5, c = 0.75)
 }
Tgrid <- seq(1, length(Data)-1, length = 20)/n
h <- 0.1
## Not run: 
##D  #For computing time purpose
##D   bootCI.ts(Data, t, Tgrid, h, kernel = TruncGauss.kernel, kpar = c(sigma = 1),
##D             CritVal = 3.6, threshold = 2, type = "survival", B = 100, plot = TRUE)
##D   true.p <- NULL
##D   for(i in 1:n){
##D      true.p[i] <- 1-pparetomix(2, a = 1/Theta[i], b = 1/Theta[i]+5, c = 0.75)
##D    }
##D   lines(t, true.p, col = "red")
##D   bootCI.ts(Data, t, Tgrid, h, kernel = TruncGauss.kernel, kpar = c(sigma = 1),
##D  prob = 0.999, type = "quantile", B = 100, plot = TRUE)
##D   true.quantile <- NULL
##D   for(i in 1:n){
##D      true.quantile[i] <- qparetomix(0.999, a = 1/Theta[i], b = 1/Theta[i]+5, c = 0.75)
##D    }
##D   lines(t, log(true.quantile), col = "red")
## End(Not run)





