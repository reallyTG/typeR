library(fda.usc)


### Name: fregre.basis.cv
### Title: Cross-validation Functional Regression with scalar response
###   using basis representation.
### Aliases: fregre.basis.cv
### Keywords: regression

### ** Examples


data(tecator)
x<-tecator$absorp.fdata[1:129]
y=tecator$y$Fat[1:129]
b1<-c(15,21,31)
b2<-c(7,9)
res1=fregre.basis.cv(x,y,basis.x=b1)
res2=fregre.basis.cv(x,y,basis.x=b1,basis.b=b2)
res1$gcv
res2$gcv
## Not run: 
##D l=2^(-4:10)
##D res3=fregre.basis.cv(x,y,basis.b=b1,type.basis="fourier",
##D lambda=l,type.CV=GCV.S,par.CV=list(trim=0.15))
##D res3$gcv
## End(Not run)



