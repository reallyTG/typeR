library(fda.usc)


### Name: fregre.lm
### Title: Fitting Functional Linear Models
### Aliases: fregre.lm
### Keywords: regression

### ** Examples


data(tecator)
x=tecator$absorp.fdata
y=tecator$y$Fat
tt=x[["argvals"]]
dataf=as.data.frame(tecator$y)

nbasis.x=11
nbasis.b=7
basis1=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.x)
basis2=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.b)
 
f=Fat~Protein+x
basis.x=list("x"=basis1)
basis.b=list("x"=basis2)
ldata=list("df"=dataf,"x"=x)
res=fregre.lm(f,ldata,basis.x=basis.x,basis.b=basis.b)
summary(res)

f2=Fat~Protein+xd
xd=fdata.deriv(x,nderiv=2,class.out='fdata',nbasis=nbasis.x)
ldata2=list("df"=dataf,"xd"=xd)
basis.x2=list("xd"=basis1)
basis.b2=list("xd"=basis2)
res2=fregre.lm(f2,ldata2,basis.x=basis.x2,basis.b=basis.b2)
summary(res2)

par(mfrow=c(2,1))
plot(res$beta.l$x,main="functional beta estimation")
plot(res2$beta.l$xd,col=2)




