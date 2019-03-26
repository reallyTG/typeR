library(vegclust)


### Name: CAP
### Title: Cumulative abundance profile (CAP)
### Aliases: CAP CAP2matrix CAPcenters CAPquantile

### ** Examples

## Load stratified data
data(medreg)

## Check that 'medreg' has correct class
class(medreg)

## Look at the data for the third plot
medreg[[3]]

## Create cumulative abundance profile (CAP) for each plot
medreg.CAP = CAP(medreg)

## Look at the profile of the third plot
medreg.CAP[[3]]

## Create matrix with species abundances
medreg.X = CAP2matrix(medreg.CAP, type="total")
head(medreg.X)

## Generate and plot average profile
average.CAP = CAPcenters(medreg.CAP)
plot(average.CAP)

## Generate and plot median profile
median.CAP = CAPquantile(medreg.CAP, q = 0.5)
plot(median.CAP)




