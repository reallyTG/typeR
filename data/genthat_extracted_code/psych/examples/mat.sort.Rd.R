library(psych)


### Name: mat.sort
### Title: Sort the elements of a correlation matrix to reflect factor
###   loadings
### Aliases: mat.sort matSort
### Keywords: multivariate models

### ** Examples
data(Bechtoldt.1)
sorted <- mat.sort(Bechtoldt.1,fa(Bechtoldt.1,5))
corPlot(sorted,xlas=2) #vertical xaxis names



