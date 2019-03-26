library(fda.usc)


### Name: fregre.bootstrap
### Title: Bootstrap regression
### Aliases: fregre.bootstrap
### Keywords: regression

### ** Examples


## Not run: 
##D  
##D data(tecator)
##D iest<-1:129
##D x=tecator$absorp.fdata[iest]
##D y=tecator$y$Fat[iest]
##D nb<-5
##D ## Time-consuming
##D res.pc=fregre.pc(x,y,1:6)
##D # Fix the compontents used in the each regression
##D res.boot1=fregre.bootstrap(res.pc,nb=nb,wild=FALSE,kmax.fix=TRUE)
##D # Select the "best" compontents used in the each regression
##D res.boot2=fregre.bootstrap(res.pc,nb=nb,wild=FALSE,kmax.fix=FALSE) 
##D res.boot3=fregre.bootstrap(res.pc,nb=nb,wild=FALSE,kmax.fix=10) 
##D ## predicted responses and bootstrap confidence interval
##D newx=tecator$absorp.fdata[-iest]
##D res.boot4=fregre.bootstrap(res.pc,nb=nb,wild=FALSE,newX=newx,draw=TRUE)
## End(Not run)



