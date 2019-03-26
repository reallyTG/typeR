library(polyRAD)


### Name: EstimateContaminationRate
### Title: Estimate Sample Contamination Using Blanks
### Aliases: EstimateContaminationRate EstimateContaminationRate.RADdata
### Keywords: manip

### ** Examples

# dataset for this example
data(Msi01genes)

# give the name of the taxon that is blank
Msi01genes <- SetBlankTaxa(Msi01genes, "blank")

# Fifteen libraries were done; blank is pooled over all of them, and
# most other samples are pooled over two libraries.
mymult <- 2/15

# estimate the contamination rate
Msi01genes <- EstimateContaminationRate(Msi01genes, multiplier = mymult)



