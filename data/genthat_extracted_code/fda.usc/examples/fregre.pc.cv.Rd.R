library(fda.usc)


### Name: fregre.pc.cv
### Title: Functional penalized PC regression with scalar response using
###   selection of number of PC components
### Aliases: fregre.pc.cv
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D x<-tecator$absorp.fdata[1:129]
##D y<-tecator$y$Fat[1:129]
##D # no penalization
##D  res.pc1=fregre.pc.cv(x,y,8)
##D # 2nd derivative penalization
##D  res.pc2=fregre.pc.cv(x,y,8,lambda=TRUE,P=c(0,0,1))
##D #Ridge regression
##D res.pc3=fregre.pc.cv(x,y,1:8,lambda=TRUE,P=1) 
## End(Not run)



