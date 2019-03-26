library(ccaPP)


### Name: ccaProj
### Title: (Robust) CCA via projections through the data points
### Aliases: CCAproj ccaProj
### Keywords: multivariate robust

### ** Examples

data("diabetes")
x <- diabetes$x
y <- diabetes$y

## Spearman correlation
ccaProj(x, y, method = "spearman")

## Pearson correlation
ccaProj(x, y, method = "pearson")



