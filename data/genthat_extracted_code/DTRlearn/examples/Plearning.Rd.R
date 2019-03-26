library(DTRlearn)


### Name: Plearning
### Title: Plearning
### Aliases: Plearning

### ** Examples

n_cluster=10
pinfo=10
pnoise=20
example2=make_2classification(n_cluster,pinfo,pnoise,100)
pi=list()
pi[[2]]=pi[[1]]=rep(1,100)
modelP=Plearning(example2$X,example2$A,example2$R,100,2,pi)



