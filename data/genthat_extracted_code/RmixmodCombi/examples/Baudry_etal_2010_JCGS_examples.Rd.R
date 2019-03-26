library(RmixmodCombi)


### Name: Baudry_etal_2010_JCGS_examples
### Title: Simulated Example Datasets From Baudry et al. (2010)
### Aliases: Baudry_etal_2010_JCGS_examples Test1D ex4.1 ex4.2 ex4.3
###   ex4.4.1 ex4.4.2
### Keywords: datasets

### ** Examples


set.seed(1)

data(Baudry_etal_2010_JCGS_examples)

output <- mixmodCombi(ex4.4.2, nbCluster = 1:10, 
models = mixmodGaussianModel(listModels = "Gaussian_pk_Lk_Ck")) 

output # is of class MixmodCombi

## Not run: 
##D plot(output) # plots the hierarchy of combined solutions, then some "entropy plots" 
##D # which may help to select the number of classes
## End(Not run)




