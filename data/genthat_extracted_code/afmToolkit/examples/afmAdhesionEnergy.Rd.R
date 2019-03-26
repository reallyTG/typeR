library(afmToolkit)


### Name: afmAdhesionEnergy
### Title: Adhesion Energy
### Aliases: afmAdhesionEnergy

### ** Examples

path <- path.package("afmToolkit")
data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path)
data <- afmContactPoint(data, width = 20, mul1 = 1, mul2 = 10)
data <- afmDetachPoint(data, width = 20, mul1 = 2, mul2 = 30)
data <- afmBaselineCorrection(data)
data <- afmAdhesionEnergy(data, width = 20, mul = 10)
str(data$AdhEner)



