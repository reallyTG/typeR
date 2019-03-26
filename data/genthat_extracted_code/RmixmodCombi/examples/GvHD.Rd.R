library(RmixmodCombi)


### Name: GvHD
### Title: GvHD Dataset
### Aliases: GvHD GvHD.control GvHD.pos
### Keywords: datasets

### ** Examples


set.seed(1)

data(GvHD)

dat <- GvHD.pos[1:500,] # only a few lines for a quick example

output <- mixmodCombi(dat, nbCluster = 1:10,
models = mixmodGaussianModel(listModels = "Gaussian_pk_Lk_Ck")) 

output # is of class MixmodCombi

## Not run: 
##D plot(output) # plots the hierarchy of combined solutions, then some "entropy plots" which may help 
##D # to select the number of classes
## End(Not run)




