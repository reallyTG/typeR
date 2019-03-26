library(vegclust)


### Name: plot.CAP
### Title: Draws cummulative abundance profiles
### Aliases: plot.CAP plot.stratifiedvegdata

### ** Examples

## Load stratified data
data(medreg)

## Check that 'medreg' has correct class
class(medreg)

## Create cumulative abundance profile (CAP) for each plot
medreg.CAP = CAP(medreg)

## Draw the stratified data and profile corresponding to the third plot
plot(medreg, plots="3")
plot(medreg.CAP, plots="3")

## Look at the plot and CAP of the same plot
medreg[["3"]]
medreg.CAP[["3"]]



