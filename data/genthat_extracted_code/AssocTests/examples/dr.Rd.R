library(AssocTests)


### Name: dr
### Title: Distance regression
### Aliases: dr

### ** Examples

data(drS.eg)
null.space <- 1
x.mat <- matrix(c(rep(1, 600), rep(0, 200)), ncol=2)
dr(drS.eg, null.space, x.mat, permute = TRUE, n.MonteCarlo = 50, seed = NULL)



