library(mvLSW)


### Name: AutoCorrIP
### Title: Wavelet Autocorrelation Inner Product Functions
### Aliases: AutoCorrIP
### Keywords: AutoCorrIP

### ** Examples

## Plot Haar autocorrelation wavelet functions inner product
AInnProd <- AutoCorrIP(J = 8, filter.number = 1, family = "DaubExPhase")
## Not run: 
##D MaxOffset <- 2^8
##D for(h in 6:8){
##D   x11()
##D   par(mfrow = c(3, 3))
##D   for(l in 6:8){
##D     for(j in 6:8){
##D       plot(-MaxOffset:MaxOffset, AInnProd[, j, l, h], type = "l", 
##D         xlab = "lambda", ylab = "Autocorr Inner Prod", 
##D         main = paste("j :", j, "- l :", l, "- h :", h))
##D     }
##D   }
##D }
## End(Not run)

## Special case relating to ipndacw function from wavethresh package
Amat <- matrix(NA, ncol = 8, nrow = 8)
for(j in 1:8) Amat[, j] <- AInnProd[2^8 + 1, j, j, ]
round(Amat, 5)
round(ipndacw(J = -8, filter.number = 1, family = "DaubExPhase"), 5)



