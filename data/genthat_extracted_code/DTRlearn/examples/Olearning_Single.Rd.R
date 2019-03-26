library(DTRlearn)


### Name: Olearning_Single
### Title: Improved single stage O-learning with cross validation
### Aliases: Olearning_Single

### ** Examples

n_cluster=5
pinfo=10
pnoise=10
n_sample=50
set.seed(3)
example=make_classification(n_cluster,pinfo,pnoise,n_sample)
pi=list()
pi[[2]]=pi[[1]]=rep(1,n_sample)
modelrbf=Olearning_Single(example$X,example$A,example$R,kernel='rbf',m=3,sigma=0.05)
modellinear=Olearning_Single(example$X,example$A,example$R)



