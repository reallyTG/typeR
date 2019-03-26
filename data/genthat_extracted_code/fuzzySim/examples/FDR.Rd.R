library(fuzzySim)


### Name: FDR
### Title: False Discovery Rate
### Aliases: FDR
### Keywords: multivariate

### ** Examples

data(rotif.env)

names(rotif.env)

FDR(data = rotif.env, sp.cols = 18, var.cols = 5:17)

FDR(data = rotif.env, sp.cols = 18, var.cols = 5:17, simplif = TRUE)




