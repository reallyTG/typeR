library(caret)


### Name: ggplot.rfe
### Title: Plot RFE Performance Profiles
### Aliases: ggplot.rfe plot.rfe
### Keywords: hplot

### ** Examples


## Not run: 
##D data(BloodBrain)
##D 
##D x <- scale(bbbDescr[,-nearZeroVar(bbbDescr)])
##D x <- x[, -findCorrelation(cor(x), .8)]
##D x <- as.data.frame(x)
##D 
##D set.seed(1)
##D lmProfile <- rfe(x, logBBB,
##D                  sizes = c(2:25, 30, 35, 40, 45, 50, 55, 60, 65),
##D                  rfeControl = rfeControl(functions = lmFuncs,
##D                                          number = 200))
##D plot(lmProfile)
##D plot(lmProfile, metric = "Rsquared")
##D ggplot(lmProfile)
## End(Not run)



