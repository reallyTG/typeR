library(fda.usc)


### Name: fregre.basis
### Title: Functional Regression with scalar response using basis
###   representation.
### Aliases: fregre.basis
### Keywords: regression

### ** Examples


# fregre.basis
data(tecator)
names(tecator)
absorp=tecator$absorp.fdata
ind=1:129
x=absorp[ind,]
y=tecator$y$Fat[ind]
tt=absorp[["argvals"]]
res1=fregre.basis(x,y)
summary(res1)
basis1=create.bspline.basis(rangeval=range(tt),nbasis=19)
basis2=create.bspline.basis(rangeval=range(tt),nbasis=9)
res5=fregre.basis(x,y,basis1,basis2)
summary(res5)
x.d2=fdata.deriv(x,nbasis=19,nderiv=1,method="bspline",class.out="fdata")
res7=fregre.basis(x.d2,y,basis1,basis2)
summary(res7)



