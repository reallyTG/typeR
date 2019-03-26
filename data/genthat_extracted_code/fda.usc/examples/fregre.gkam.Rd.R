library(fda.usc)


### Name: fregre.gkam
### Title: Fitting Functional Generalized Kernel Additive Models.
### Aliases: fregre.gkam kgam.H
### Keywords: regression

### ** Examples

## Not run: 
##D data(tecator)
##D ab=tecator$absorp.fdata[1:100]
##D ab2=fdata.deriv(ab,2)
##D yfat=tecator$y[1:100,"Fat"]
##D 
##D # Example 1: # Changing the argument par.np and family
##D yfat.cat=ifelse(yfat<15,0,1)
##D xlist=list("df"=data.frame(yfat.cat),"ab"=ab,"ab2"=ab2)
##D f2<-yfat.cat~ab+ab2
##D 
##D par.NP<-list("ab"=list(Ker=AKer.norm,type.S="S.NW"),
##D "ab2"=list(Ker=AKer.norm,type.S="S.NW"))
##D res2=fregre.gkam(f2,family=binomial(),data=xlist,
##D par.np=par.NP)
##D res2
##D 
##D # Example 2: Changing the argument par.metric and family link
##D par.metric=list("ab"=list(metric=semimetric.deriv,nderiv=2,nbasis=15),
##D "ab2"=list("metric"=semimetric.basis))
##D res3=fregre.gkam(f2,family=binomial("probit"),data=xlist,
##D par.metric=par.metric,control=list(maxit=2,trace=FALSE))
##D summary(res3)
##D 
##D # Example 3: Gaussian family (by default)
##D # Only 1 iteration (by default maxit=100)
##D xlist=list("df"=data.frame(yfat),"ab"=ab,"ab2"=ab2)
##D f<-yfat~ab+ab2
##D res=fregre.gkam(f,data=xlist,control=list(maxit=1,trace=FALSE))
##D res
## End(Not run)



