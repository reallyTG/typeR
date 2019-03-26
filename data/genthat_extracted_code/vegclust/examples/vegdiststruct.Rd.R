library(vegclust)


### Name: vegdiststruct
### Title: Structural and compositional dissimilarity
### Aliases: vegdiststruct

### ** Examples

## Load stratified data
data(medreg)

## Check that 'medreg' has correct class
class(medreg)

## Create cumulative abundance profile (CAP) for each plot
medreg.CAP = CAP(medreg)

## Create dissimilarity (percentage difference) matrix using profiles
medreg.D = vegdiststruct(medreg, method="bray")

## Create dissimilarity (percentage difference) matrix using abundances
medreg.D2 = vegdiststruct(medreg, method="bray", type="total")

## Calculate correlation
cor(as.vector(medreg.D), as.vector(medreg.D2))




