library(fda.usc)


### Name: fregre.pc
### Title: Functional Regression with scalar response using Principal
###   Components Analysis.
### Aliases: fregre.pc
### Keywords: regression

### ** Examples

## Not run: 
##D data(tecator)
##D absorp=tecator$absorp.fdata
##D ind=1:129
##D x=absorp[ind,]
##D y=tecator$y$Fat[ind]
##D res=fregre.pc(x,y)
##D summary(res)
##D res2=fregre.pc(x,y,l=c(1,3,4))
##D summary(res2)
##D # Functional Ridge Regression
##D res3=fregre.pc(x,y,l=c(1,3,4),lambda=1,P=1)
##D summary(res3)
##D # Functional Regression with 2nd derivative penalization
##D res4=fregre.pc(x,y,l=c(1,3,4),lambda=1,P=c(0,0,1))
##D summary(res4)
##D betas<-c(res$beta.est,res2$beta.est,res3$beta.est,res4$beta.est)
##D plot(betas)
## End(Not run)



