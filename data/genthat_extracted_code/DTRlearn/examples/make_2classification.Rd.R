library(DTRlearn)


### Name: make_2classification
### Title: Data Simulation for 2 stages
### Aliases: make_2classification

### ** Examples

n_cluster=5
pinfo=10
pnoise=10
n_sample=50
example2=make_2classification(n_cluster,pinfo,pnoise,n_sample)
pi=list()
pi[[2]]=pi[[1]]=rep(1,n_sample)
set.seed(3)
modelO=Olearning(example2$X,example2$A,example2$R,n_sample,2,pi)
modelP=Plearning(example2$X,example2$A,example2$R,n_sample,2,pi)
modelQ=Qlearning(example2$X,example2$A,example2$R,2)



