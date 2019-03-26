library(fda.usc)


### Name: fregre.pls.cv
### Title: Functional penalized PLS regression with scalar response using
###   selection of number of PLS components
### Aliases: fregre.pls.cv
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D x<-tecator$absorp.fdata[1:129]
##D y<-tecator$y$Fat[1:129]
##D # no penalization
##D pls1<- fregre.pls.cv(x,y,8)
##D # 2nd derivative penalization
##D pls2<-fregre.pls.cv(x,y,8,lambda=0:5,P=c(0,0,1))
## End(Not run)




