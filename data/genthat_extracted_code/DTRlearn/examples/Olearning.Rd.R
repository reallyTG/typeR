library(DTRlearn)


### Name: Olearning
### Title: Multiple stage Improved Olearning
### Aliases: Olearning
### Keywords: models

### ** Examples

n_cluster=10
pinfo=10
pnoise=20
example2=make_2classification(n_cluster,pinfo,pnoise,200)
test=make_2classification(n_cluster,pinfo,pnoise,200,example2$centroids)
pi=list()
pi[[2]]=pi[[1]]=rep(1,200)
modelO=Olearning(example2$X,example2$A,example2$R,200,2,pi)



