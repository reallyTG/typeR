library(FacPad)


### Name: gibbs_sampling
### Title: A Collapsed Gibbs Sampling Algorithm for the Inference of Sparse
###   Bayesian Factor Models
### Aliases: gibbs_sampling

### ** Examples


data(matrixY)
data(matrixL)
result<-gibbs_sampling(matrixY,matrixL,max_iter=50,thin=10,
file_name="test_50iter.RData")




