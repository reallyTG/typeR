library(embryogrowth)


### Name: uncertainty.datalogger
### Title: Uncertainty of average temperatures obtained using temperature
###   data logger
### Aliases: uncertainty.datalogger

### ** Examples

## Not run: 
##D library(embryogrowth)
##D # Exemple using the hypothesis of Gaussian distribution
##D uncertainty.datalogger(sample.rate=30, accuracy=1, resolution=0.5, 
##D                 method=function(x) {2*qnorm(0.975)*sd(x)})
##D # Example without hypothesis about distribution, using quantiles
##D uncertainty.datalogger(sample.rate=30, accuracy=1, resolution=0.5, 
##D                 method=function(x) {quantile(x, probs=c(0.975))-
##D                                               quantile(x, probs=c(0.025))})
##D par(mar=c(4, 4, 1, 1))
##D plot(x=10:120, uncertainty.datalogger(sample.rate=10:120, 
##D                                       accuracy=0.5, 
##D                                       resolution=1), 
##D      las=1, bty="n", type="l", 
##D      xlab="Sample rate in minutes", 
##D      ylab=expression("Uncertainty in "*degree*"C"), 
##D      ylim=c(0, 0.15), xlim=c(0, 120))  
##D lines(x=10:120, uncertainty.datalogger(sample.rate=10:120, 
##D                                             accuracy=1, 
##D                                             resolution=0.5), col="red")
##D lines(x=10:120, uncertainty.datalogger(sample.rate=10:120, 
##D                                        accuracy=1, 
##D                                        resolution=1), col="blue")
##D lines(x=10:120, uncertainty.datalogger(sample.rate=10:120, 
##D                                        accuracy=0.5, 
##D                                        resolution=0.5), col="yellow")
##D legend("topleft", legend=c("Accuracy=0.5, resolution=0.5", 
##D                            "Accuracy=0.5, resolution=1", 
##D                            "Accuracy=1, resolution=0.5", 
##D                            "Accuracy=1, resolution=1"), lty=1, 
##D        col=c("yellow", "black", "red", "blue"), 
##D        cex=0.6)
## End(Not run)



