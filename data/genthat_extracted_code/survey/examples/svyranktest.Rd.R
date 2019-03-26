library(survey)


### Name: svyranktest
### Title: Design-based rank tests
### Aliases: svyranktest
### Keywords: survey htest

### ** Examples


data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, fpc=~fpc, data=apiclus1)

svyranktest(ell~comp.imp, dclus1)
svyranktest(ell~comp.imp, dclus1, test="median")


svyranktest(ell~stype, dclus1)
svyranktest(ell~stype, dclus1, test="median")



## upper quartile
svyranktest(ell~comp.imp, dclus1, test=function(r,N) as.numeric(r>0.75*N))


quantiletest<-function(p){
	  rval<-function(r,N) as.numeric(r>(N*p))
	  attr(rval,"name")<-paste(p,"quantile")
	  rval
	}
svyranktest(ell~comp.imp, dclus1, test=quantiletest(0.5))
svyranktest(ell~comp.imp, dclus1, test=quantiletest(0.75))





