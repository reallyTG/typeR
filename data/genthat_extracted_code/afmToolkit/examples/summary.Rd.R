library(afmToolkit)


### Name: summary.afmdata
### Title: Summary of an 'afmdata' class object.
### Aliases: summary.afmdata

### ** Examples

## Not run: 
##D path <- path.package("afmToolkit")
##D data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path)
##D data <- afmContactPoint(data, width = 20, mul1 = 1, mul2 = 10)
##D data <- afmDetachPoint(data, width = 20, mul1 = 2, mul2 = 30)
##D data <- afmBaselineCorrection(data)
##D data <- afmAdhesionEnergy(data, width = 20, mul = 10)
##D data <- afmZeroPointSlope(data, segment = "approach")
##D data <- afmIndentation(data)
##D data <- afmYoungModulus(data, thickness = 1e-7, params = list(alpha = 22),
##D                         silent = TRUE)
##D data <- afmExpDecay(data, nexp = 2, type = "CH")
##D summary(data)
## End(Not run)                        



