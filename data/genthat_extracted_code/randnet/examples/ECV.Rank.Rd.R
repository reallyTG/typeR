library(randnet)


### Name: ECV.Rank
### Title: estimates optimal low rank model for a network
### Aliases: ECV.Rank
### Keywords: rank estimation

### ** Examples


dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A


ecv.rank <- ECV.Rank(A,6,weighted=FALSE,mode="undirected")

ecv.rank




