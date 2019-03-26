library(palaeoSig)


### Name: multi.mat
### Title: MAT for multiple variables
### Aliases: multi.mat
### Keywords: multivariate

### ** Examples


data(arctic.env)
data(arctic.pollen)

mMAT <- multi.mat(arctic.pollen, arctic.env[,9:67], noanalogues = 5)




