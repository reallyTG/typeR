library(fda.usc)


### Name: fregre.plm
### Title: Semi-functional partially linear model with scalar response.
### Aliases: fregre.plm
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D x=tecator$absorp.fdata[1:129]
##D dataf=tecator$y[1:129,]
##D 
##D f=Fat~Water+x
##D ldata=list("df"=dataf,"x"=x)
##D res.plm=fregre.plm(f,ldata)
##D summary(res.plm)
##D 
##D # with 2nd derivative of functional data
##D x.fd=fdata.deriv(x,nderiv=2)
##D f2=Fat~Water+x.fd
##D ldata2=list("df"=dataf,"x.fd"=x.fd)
##D res.plm2=fregre.plm(f2,ldata2)
##D summary(res.plm2)
## End(Not run)



