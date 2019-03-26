library(analogue)


### Name: plot.residLen
### Title: Plot method for residual lengths
### Aliases: plot.residLen
### Keywords: hplot methods

### ** Examples

## load the Imbrie and Kipp example data
data(ImbrieKipp, SumSST, V12.122)

## squared residual lengths for Core V12.122
rlens <- residLen(ImbrieKipp, SumSST, V12.122)
rlens

## plot a histogram of the residual distances
plot(rlens)




