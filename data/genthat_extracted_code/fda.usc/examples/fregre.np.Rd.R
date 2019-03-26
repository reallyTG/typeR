library(fda.usc)


### Name: fregre.np
### Title: Functional regression with scalar response using non-parametric
###   kernel estimation
### Aliases: fregre.np
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D absorp=tecator$absorp.fdata
##D ind=1:129
##D x=absorp[ind,]
##D y=tecator$y$Fat[ind]
##D 
##D res.np=fregre.np(x,y,Ker=AKer.epa)
##D summary.fregre.fd(res.np)
##D res.np2=fregre.np(x,y,Ker=AKer.tri)
##D summary.fregre.fd(res.np2)
##D 
##D # with other semimetrics.
##D res.pca1=fregre.np(x,y,Ker=AKer.tri,metri=semimetric.pca,q=1)
##D summary.fregre.fd(res.pca1)
##D res.deriv=fregre.np(x,y,metri=semimetric.deriv)
##D summary.fregre.fd(res.deriv)
##D x.d2=fdata.deriv(x,nderiv=1,method="fmm",class.out='fdata')
##D res.deriv2=fregre.np(x.d2,y)
##D summary.fregre.fd(res.deriv2)
##D x.d3=fdata.deriv(x,nderiv=1,method="bspline",class.out='fdata')
##D res.deriv3=fregre.np(x.d3,y)
##D summary.fregre.fd(res.deriv3)
## End(Not run)



