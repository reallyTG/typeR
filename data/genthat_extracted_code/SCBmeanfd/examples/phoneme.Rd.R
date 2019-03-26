library(SCBmeanfd)


### Name: phoneme
### Title: Phoneme data
### Aliases: phoneme
### Keywords: datasets

### ** Examples

## Not run: 
##D data(phoneme)
##D freq <- 1:150
##D classes <- phoneme[,151]
##D phoneme <- phoneme[,-151]
##D classnames <- c("sh", "iy", "dcl", "aa", "ao")
##D 
##D ## Local linear fit to the mean log-periodogram for each phoneme 
##D llfit <- mapply(locpoly, y = by(phoneme, classes, colMeans), 
##D           MoreArgs = list(x = freq, bandwidth = 2, degree = 1, 
##D           gridsize = length(freq)))
##D llfit.y <- matrix(unlist(llfit["y",]), 150, 5)  
##D matplot(freq, llfit.y, type = "l", lty = 1, xlab = "Frequency (scaled)", 
##D 	ylab = "Log-intensity", 
##D 	main = "Local linear estimation\nof the population mean log-periodogram")
##D legend("topright", legend = classnames, col = 1:5, lty = 1)
## End(Not run)



