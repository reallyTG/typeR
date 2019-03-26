library(tsvr)


### Name: vr
### Title: Compute the classic or Loreau-de Mazancourt variance ratio
### Aliases: vr

### ** Examples

X<-matrix(runif(200,1,100), 10, 20)
vr(X, method="LdM")
vr(X, method="classic")




