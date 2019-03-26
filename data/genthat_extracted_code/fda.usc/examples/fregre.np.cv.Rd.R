library(fda.usc)


### Name: fregre.np.cv
### Title: Cross-validation functional regression with scalar response
###   using kernel estimation.
### Aliases: fregre.np.cv
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D absorp=tecator$absorp.fdata
##D ind=1:129
##D x=absorp[ind,]
##D y=tecator$y$Fat[ind]
##D Ker=AKer.tri
##D res.np=fregre.np.cv(x,y,Ker=Ker)
##D summary.fregre.fd(res.np)
##D res.np2=fregre.np.cv(x,y,type.CV=GCV.S,criteria="Shibata")
##D summary.fregre.fd(res.np2)
##D 
##D ## Example with other semimetrics (not run)
##D res.pca1=fregre.np.cv(x,y,Ker=Ker,metric=semimetric.pca,q=1)
##D summary.fregre.fd(res.pca1)
##D res.deriv=fregre.np.cv(x,y,Ker=Ker,metric=semimetric.deriv)
##D summary.fregre.fd(res.deriv)
##D 
##D x.d2=fdata.deriv(x,nderiv=1,method="fmm",class.out='fdata')
##D res.deriv2=fregre.np.cv(x.d2,y,Ker=Ker)
##D summary.fregre.fd(res.deriv2)
##D x.d3=fdata.deriv(x,nderiv=1,method="bspline",class.out='fdata')
##D res.deriv3=fregre.np.cv(x.d3,y,Ker=Ker)
##D summary.fregre.fd(res.deriv3)
## End(Not run)



