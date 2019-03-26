library(latticeExtra)


### Name: biocAccess
### Title: Hourly access attempts to Bioconductor website
### Aliases: biocAccess
### Keywords: datasets

### ** Examples

data(biocAccess)
xyplot(stl(ts(biocAccess$counts[1:(24 * 30)], frequency = 24), "periodic"))



