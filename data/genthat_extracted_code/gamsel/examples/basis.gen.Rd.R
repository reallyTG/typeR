library(gamsel)


### Name: basis.gen
### Title: Generate pseudo-spline bases
### Aliases: basis.gen pseudo.bases
### Keywords: regression smooth nonparametric

### ** Examples

data=gendata(n=500,p=12,k.lin=3,k.nonlin=3,deg=8,sigma=0.5)
attach(data)
bases=pseudo.bases(X,degree=10,df=6)
## Not run: 
##D      require(doMC)
##D      registerDoMC(cores=4)
##D      bases=pseudo.bases(X,degree=10,df=6,parallel=TRUE)
## End(Not run)



