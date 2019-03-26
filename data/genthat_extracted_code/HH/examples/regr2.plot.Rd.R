library(HH)


### Name: regr2.plot
### Title: 3D plot of z against x and y, with regression plane fit and
###   display of squared residuals.
### Aliases: regr2.plot
### Keywords: models regression

### ** Examples

data(fat)
regr2.plot(fat[,"abdomin"], xlab="abdomin",
           fat[,"biceps"],  ylab="biceps",
           fat[,"bodyfat"], zlab="bodyfat",
           resid.plot="square",
           eye=c(335.5, 115.65, 171.9),   ## used only in S-Plus
           theta=140, phi=35, r=sqrt(15), ## used only in R
           box=is.R(),
           plot.back.planes=FALSE,
           main="Least-squares with two X-variables")

## Not run: 
##D   demo("regr2", package="HH", ask=FALSE)
##D   ## run the file manually to see the individual steps.
## End(Not run)



