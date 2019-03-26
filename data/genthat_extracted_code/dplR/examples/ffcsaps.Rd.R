library(dplR)


### Name: ffcsaps
### Title: Smoothing Spline with User-Specified Rigidity and Frequency
###   Cutoff
### Aliases: ffcsaps
### Keywords: smooth

### ** Examples
library(graphics)
library(utils)
docFile <- system.file("doc", "math-dplR.pdf", package="dplR")
cat("See the following PDF for mathematical details:\n")
cat(docFile, sep="\n")
## Not run: 
##D if (interactive() && requireNamespace("Biobase")) {
##D     Biobase::openPDF(docFile)
##D }
##D ## Use series CAM011 from the Campito data set
##D data(ca533)
##D series <- ca533[, "CAM011"]
##D series <- series[!is.na(series)]
##D plot(series, type = "l", ylab = "Ring Width (mm)", col = "grey")
##D lines(ffcsaps(series, nyrs = 32), col = "red", lwd = 2)
##D lines(ffcsaps(series, nyrs = 64), col = "green", lwd = 2)
##D lines(ffcsaps(series, nyrs = 128), col = "blue", lwd = 2)
## End(Not run)
## Use first series from the Mesa Verde data set
data(co021)
series <- co021[, 1]
series <- series[!is.na(series)]
plot(series, type = "l", ylab = "Ring Width (mm)", col = "grey")
lines(ffcsaps(series, nyrs = 32), col = "red", lwd = 2)
lines(ffcsaps(series, nyrs = 64), col = "green", lwd = 2)
## nyrs defaults to 0.5*length(series) == 347
lines(ffcsaps(series), col = "blue", lwd = 2)
legend("topright",
       c("Series", "nyrs=32", "nyrs=64",
         paste("Default nyrs (", length(series) / 2, ")", sep="")),
       fill=c("grey", "red", "green", "blue"))



