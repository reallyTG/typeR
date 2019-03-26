library(adegenet)


### Name: Inbreeding estimation
### Title: Likelihood-based estimation of inbreeding
### Aliases: inbreeding

### ** Examples

## Not run: 
##D ## cattle breed microsatellite data
##D data(microbov)
##D 
##D ## isolate Lagunaire breed
##D lagun <- seppop(microbov)$Lagunaire
##D 
##D ## estimate inbreeding - return sample of F values
##D Fsamp <- inbreeding(lagun, N=30)
##D 
##D ## plot the first 10 results
##D invisible(sapply(Fsamp[1:10], function(e) plot(density(e), xlab="F",
##D xlim=c(0,1), main="Density of the sampled F values")))
##D 
##D ## compute means for all individuals
##D Fmean=sapply(Fsamp, mean)
##D hist(Fmean, col="orange", xlab="mean value of F",
##D main="Distribution of mean F across individuals")
##D 
##D ## estimate inbreeding - return proba density functions
##D Fdens <- inbreeding(lagun, res.type="function")
##D 
##D ## view function for the first individual
##D Fdens[[1]]
##D 
##D ## plot the first 10 functions
##D invisible(sapply(Fdens[1:10], plot, ylab="Density",
##D main="Density of probability of F values"))
##D 
##D ## estimate inbreeding - return maximum likelihood estimates
##D Fest <- inbreeding(lagun, res.type = "estimate")
##D mostInbred <- which.max(Fest)
##D plot(Fdens[[mostInbred]], ylab = "Density", xlab = "F",
##D      main = paste("Probability density of F values\nfor", names(mostInbred)))
##D abline(v = Fest[mostInbred], col = "red", lty = 2)
##D legend("topright", legend = "MLE", col = "red", lty = 2)
##D 
##D ## note that estimates and average samples are likely to be different.
##D plot(Fest, ylab = "F", col = "blue",
##D      main = "comparison of MLE and average sample estimates of F")
##D points(Fmean, pch = 2, col = "red")
##D arrows(x0 = 1:length(Fest), y0 = Fest, 
##D        y1 = Fmean, x1 = 1:length(Fest), length = 0.125)
##D legend("topleft", legend = c("estimate", "sample"), col = c("blue", "red"),
##D        pch = c(1, 2), title = "res.type")
## End(Not run)



