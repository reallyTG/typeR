library(ccaPP)


### Name: ccaGrid
### Title: (Robust) CCA via alternating series of grid searches
### Aliases: CCAgrid ccaGrid print.cca
### Keywords: multivariate robust

### ** Examples

data("diabetes")
x <- diabetes$x
y <- diabetes$y

## Spearman correlation
ccaGrid(x, y, method = "spearman")

## Pearson correlation
ccaGrid(x, y, method = "pearson")



