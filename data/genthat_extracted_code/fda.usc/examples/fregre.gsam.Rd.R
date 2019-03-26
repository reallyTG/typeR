library(fda.usc)


### Name: fregre.gsam
### Title: Fitting Functional Generalized Spectral Additive Models
### Aliases: fregre.gsam
### Keywords: regression

### ** Examples


data(tecator)
x=tecator$absorp.fdata
x.d1<-fdata.deriv(x)
tt<-x[["argvals"]]
dataf=as.data.frame(tecator$y)
nbasis.x=11;nbasis.b=5
basis1=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.x)
basis2=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.b)
f=Fat~s(Protein)+s(x)
basis.x=list("x"=basis1,"x.d1"=basis1)
basis.b=list("x"=basis2,"x.d1"=basis2)
ldata=list("df"=dataf,"x"=x,"x.d1"=x.d1)
res=fregre.gsam(Fat~Water+s(Protein)+x+s(x.d1),ldata,family=gaussian(),
basis.x=basis.x,basis.b=basis.b)
res

## Not run: 
##D res2=fregre.gsam(Fat~te(Protein,k=3)+x,data=ldata,family=gaussian())
##D summary(res2)
##D 
##D ##  dropind basis pc
##D basis.pc0=create.pc.basis(x,c(2,4,7))
##D basis.pc1=create.pc.basis(x.d1,c(1:3))
##D basis.x=list("x"=basis.pc0,"x.d1"=basis.pc1)
##D ldata=list("df"=dataf,"x"=x,"x.d1"=x.d1)  
##D res.pc=fregre.gsam(f,data=ldata,family=gaussian(),
##D basis.x=basis.x,basis.b=basis.b)
##D summary(res.pc)
##D 
##D 
##D ##  Binomial family
##D x=tecator$absorp.fdata
##D tecator$y$Fat<-ifelse(tecator$y$Fat>20,1,0)
##D x.d1<-fdata.deriv(x)
##D dataf=as.data.frame(tecator$y)
##D ldata=list("df"=dataf,"x"=x,"x.d1"=x.d1)
##D res.bin=fregre.gsam(Fat~Protein+s(x),ldata,family=binomial())
## End(Not run)



