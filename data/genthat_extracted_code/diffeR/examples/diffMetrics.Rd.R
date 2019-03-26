library(diffeR)


### Name: diffMetrics
### Title: Overall difference metrics and difference metrics at the
###   category level or between pairs of categories
### Aliases: differenceMetrics exchangeDij exchangeDj overallAllocD
###   overallDiff overallDiffCatj overallExchangeD overallQtyD
###   overallShiftD quantityDj shiftDj omissionj comissionj agreementj
### Keywords: internal

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
ctmatCompRef <- crosstabm(comp, ref)

exchangeDij(ctmatCompRef)
exchangeDj(ctmatCompRef)
overallAllocD(ctmatCompRef)
overallDiff(ctmatCompRef)
overallDiffCatj(ctmatCompRef)
overallExchangeD(ctmatCompRef)
overallQtyD(ctmatCompRef)
overallShiftD(ctmatCompRef)
quantityDj(ctmatCompRef)
shiftDj(ctmatCompRef)
omissionj(ctmatCompRef)
comissionj(ctmatCompRef)
agreementj(ctmatCompRef)



