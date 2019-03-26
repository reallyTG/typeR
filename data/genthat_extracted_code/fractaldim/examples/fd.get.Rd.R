library(fractaldim)


### Name: fd.get
### Title: Access Method for Objects of Class FractalDim
### Aliases: fd.get
### Keywords: programming

### ** Examples

## Not run: 
##D library(RandomFields)
##D x <- seq(0, 10000)
##D # generate a random field
##D truealpha <- 1.5
##D rf <- GaussRF(x = x, model = "stable", grid = TRUE,
##D     param = c(mean=0, variance=1, nugget=0, scale=100, 
##D         alpha=truealpha))
##D 
##D #compute fractal dimension using various methods
##D methods <- c("madogram", "variogram", "hallwood", "boxcount",
##D                        "periodogram","dctII", "wavelet")
##D fdts <- fd.estimate (rf, methods = methods, window.size = 500, 
##D     step.size = 100, nlags = 10, trim = FALSE, debuglevel = 3)
##D 
##D # plot the variation
##D cols <- rainbow(length(methods))
##D plot(ts(fd.get (fdts, methods[1])$fd),ylim=c(min(fdts$fd), max(fdts$fd)),
##D              ylab="fd", col=cols[1])
##D for (imeth in 2:length(methods)) 
##D     lines(ts(fd.get (fdts, methods[imeth])$fd), col=cols[imeth])
##D legend('topleft', legend=methods, col=cols, lwd=1)
##D abline(h=2-truealpha/2)
## End(Not run)
## Don't show: 
#	for (imeth in 1:length(methods)) fd.get (fdts, methods[imeth])$fd
## End(Don't show)



