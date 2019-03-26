library(afmToolkit)


### Name: afmZeroPointSlope
### Title: Zero Force Point and Slope
### Aliases: afmZeroPointSlope

### ** Examples

data <- afmReadJPK("force-save-JPK-2h.txt.gz", path = path.package("afmToolkit"))
data <- afmContactPoint(data, width = 20, mul1 = 1, mul2 = 20)
data <- afmDetachPoint(data, width = 40, mul1 = 3, mul2 = 40)
data <- afmBaselineCorrection(data)
data <- afmZeroPointSlope(data, segment = "approach")
## Not run: 
##D plot(data, segment = "approach") + geom_vline(xintercept = data$Slopes$Z0Point, lty = 2)
## End(Not run)



