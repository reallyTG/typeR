library(FacPad)


### Name: FacPad-package
### Title: Sparse factor modeling for the inference of drug-responsive
###   pathways
### Aliases: FacPad-package FacPad
### Keywords: package

### ** Examples


data(matrixY)
data(matrixL)
result<-gibbs_sampling(matrixY,matrixL,max_iter=30,
thin=10,file_name="test_30iter.RData")

result2<-gibbs2(matrixY,matrixL,eta0=0.2,eta1=0.2,
max_iter=50,thin=10,file_name="test_v2_50iter.RData")




