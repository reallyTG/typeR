library(fda.usc)


### Name: fregre.pls
### Title: Functional Penalized PLS regression with scalar response
### Aliases: fregre.pls
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D x<-tecator$absorp.fdata
##D y<-tecator$y$Fat
##D res=fregre.pc(x,y,c(1:8))
##D summary(res)
##D res2=fregre.pls(x,y,c(1:8),lambda=10)
##D summary(res2)
## End(Not run)



