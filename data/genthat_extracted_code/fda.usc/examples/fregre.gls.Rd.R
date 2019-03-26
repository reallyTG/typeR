library(fda.usc)


### Name: fregre.gls
### Title: Fit Functional Linear Model Using Generalized Least Squares
### Aliases: fregre.gls
### Keywords: regression,models

### ** Examples


## Not run: 
##D  
##D data(tecator)
##D x=tecator$absorp.fdata
##D x.d2<-fdata.deriv(x,nderiv=)
##D tt<-x[["argvals"]]
##D dataf=as.data.frame(tecator$y)
##D 
##D # plot the response
##D plot(ts(tecator$y$Fat))
##D 
##D nbasis.x=11;nbasis.b=7
##D basis1=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.x)
##D basis2=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.b)
##D basis.x=list("x.d2"=basis1)
##D basis.b=list("x.d2"=basis2)
##D ldata=list("df"=dataf,"x.d2"=x.d2)
##D res.gls=fregre.gls(Fat~x.d2,data=ldata, correlation=corAR1(),
##D                    basis.x=basis.x,basis.b=basis.b)
##D summary(res.gls)                   
## End(Not run)




