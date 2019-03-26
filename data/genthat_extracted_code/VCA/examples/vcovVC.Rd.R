library(VCA)


### Name: vcovVC
### Title: Calculate Variance-Covariance Matrix of Variance Components of
###   'VCA' objects.
### Aliases: vcovVC

### ** Examples

## Not run: 
##D data(realData)
##D dat1 <- realData[realData$PID==1,]
##D fit  <- anovaVCA(y~lot/calibration/day/run, dat1, SSQ.method="qf") 
##D vcovVC(fit)
##D vcovVC(fit, "scm")		# Searle-Casella-McCulloch method (1st reference)
##D vcovVC(fit, "gb")		# Giesbrecht and Burns method (2nd reference)
## End(Not run)



