library(fda.usc)


### Name: fregre.igls
### Title: Fit of Functional Generalized Least Squares Model Iteratively
### Aliases: fregre.igls
### Keywords: models

### ** Examples


## Not run: 
##D  
##D data(tecator)
##D x=tecator$absorp.fdata
##D x.d2<-fdata.deriv(x,nderiv=)
##D tt<-x[["argvals"]]
##D dataf=as.data.frame(tecator$y)
##D # plot the response
##D plot(ts(tecator$y$Fat))
##D ldata=list("df"=dataf,"x.d2"=x.d2)
##D res.gls=fregre.igls(Fat~x.d2,data=ldata,
##D  correlation=list("cor.ARMA"=list()),control=list("p"=1)) 
##D res.gls
##D res.gls$corStruct
## End(Not run)



