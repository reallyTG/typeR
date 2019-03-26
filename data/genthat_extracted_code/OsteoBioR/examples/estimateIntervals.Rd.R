library(OsteoBioR)


### Name: estimateIntervals
### Title: Function to estimate temporal changes in isotopic values
### Aliases: estimateIntervals

### ** Examples

## Not run: 
##D data <- data.frame(
##D intStart = 0:5,
##D intEnd = 1:6,
##D bone1 = c(100, 50, 20, 10, 5, 2),
##D bone2 = c(100, 10, 5, 1, 1, 1),
##D tooth1 = c(0, 100, 0, 0, 0, 0),
##D tooth2 = c(0, 0, 100, 0, 0, 0)
##D )
##D y_mean <- c(-10, -7, -12, -9)
##D y_sigma <- c(2, 1.5, 2.5, 2.5)
##D fit <- estimateIntervals(renewalRates = data,
##D                          timeVars = "intStart",
##D                          boneVars = c("bone1", "bone2", "tooth1", "tooth2"),
##D                          isoMean = y_mean,
##D                          isoSigma = y_sigma)
##D print(fit)
##D plot(fit)
##D plotTime(fit)
##D 
##D # get estimates for specific time points
##D estimateTimePoint(fit, time = seq(0,5, by = 0.5))
##D 
##D # shift point estimation
##D plotTime(fit, plotShifts = TRUE, threshold = 0.5)
##D getShiftTime(fit, threshold = 0.5)
##D 
##D #Staying time estimation
##D estimatedStayTimes <- getSiteStayTimes(object = fit,
##D siteMeans = c(-8, -10),
##D siteSigma = c(1, 1.5))
## End(Not run)




