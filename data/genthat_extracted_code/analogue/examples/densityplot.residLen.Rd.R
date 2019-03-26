library(analogue)


### Name: densityplot.residLen
### Title: Lattice density plot for residual lengths
### Aliases: densityplot.residLen densityplot
### Keywords: hplot methods

### ** Examples

## load the Imbrie and Kipp example data
data(ImbrieKipp, SumSST, V12.122)

## squared residual lengths for Core V12.122
rlens <- residLen(ImbrieKipp, SumSST, V12.122)
rlens

## plot the density functions of the residual distances
densityplot(rlens)




