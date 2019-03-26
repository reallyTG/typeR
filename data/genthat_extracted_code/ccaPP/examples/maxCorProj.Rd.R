library(ccaPP)


### Name: maxCorProj
### Title: (Robust) maximum correlation via projections through the data
###   points
### Aliases: maxCorProj
### Keywords: multivariate robust

### ** Examples

data("diabetes")
x <- diabetes$x
y <- diabetes$y

## Spearman correlation
maxCorProj(x, y, method = "spearman")
maxCorProj(x, y, method = "spearman", consistent = TRUE)

## Pearson correlation
maxCorProj(x, y, method = "pearson")



