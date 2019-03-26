library(qtlmt)


### Name: sureEst
### Title: SURE model parameter estimation
### Aliases: sureEst

### ** Examples

data(etrait)
x<- as.matrix(mdat-1/2)
y<- as.matrix(traits)[,1:3]
v<- list(c(1,25,50),numeric(0),3)
## Not run: 
##D o<- sureEst(y, x, v=v, iter=250, tol=1e-12)
## End(Not run)



