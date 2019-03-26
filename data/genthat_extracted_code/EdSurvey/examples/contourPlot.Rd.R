library(EdSurvey)


### Name: contourPlot
### Title: Overlaid Scatter and Contour Plots
### Aliases: contourPlot

### ** Examples

## Not run: 
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D lm1 <- lm.sdf(composite ~ pared * dsex + sdracem, sdf)
##D # plot the results
##D contourPlot(x=lm1$fitted.values,
##D 	          y=lm1$residuals[,1], # use only the first plausible value
##D 	          m=30,
##D 	          xlab="fitted values",
##D 	          ylab="residuals",
##D 	          main="Figure 1")
##D # add a line indicating where the residual is zero
##D abline(0,0)
## End(Not run)



