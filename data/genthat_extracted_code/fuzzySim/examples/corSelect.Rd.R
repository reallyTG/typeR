library(fuzzySim)


### Name: corSelect
### Title: Select among correlated variables based on a given criterion
### Aliases: corSelect
### Keywords: multivariate

### ** Examples

data(rotif.env)

corSelect(rotif.env, var.cols = 5:17)

corSelect(rotif.env, sp.cols = 46, var.cols = 5:17)

corSelect(rotif.env, sp.cols = 46, var.cols = 5:17, cor.thresh = 0.7)

corSelect(rotif.env, sp.cols = 46, var.cols = 5:17, method = "spearman")



