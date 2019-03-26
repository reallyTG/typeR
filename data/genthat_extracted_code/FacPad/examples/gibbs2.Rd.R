library(FacPad)


### Name: gibbs2
### Title: A Collapsed Gibbs Sampling Algorithm for the Inference of Sparse
###   Bayesian Factor Models_version2
### Aliases: gibbs2

### ** Examples


data(matrixY)
data(matrixL)
result<-gibbs2(matrixY,matrixL,eta0=0.2,eta1=0.2,
max_iter=50,thin=10,file_name="test_v2_50iter.RData")




