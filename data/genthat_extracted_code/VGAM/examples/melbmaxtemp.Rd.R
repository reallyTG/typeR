library(VGAM)


### Name: melbmaxtemp
### Title: Melbourne Daily Maximum Temperatures
### Aliases: melbmaxtemp
### Keywords: datasets

### ** Examples

summary(melbmaxtemp)
## Not run: 
##D  par(mfrow = c(1, 1), mar = c(5, 4, 0.2, 0.1) + 0.1, las = 1)
##D melb <- data.frame(today     = melbmaxtemp[-1],
##D                    yesterday = melbmaxtemp[-length(melbmaxtemp)])
##D plot(today ~ yesterday, data = melb,
##D      xlab = "Yesterday's Max Temperature",
##D      ylab = "Today's Max Temperature", cex = 1.4, type = "n")
##D points(today ~ yesterday, data = melb, pch = 0, cex = 0.50, col = "blue")
##D abline(a = 0, b = 1, lty = 3)
## End(Not run)



