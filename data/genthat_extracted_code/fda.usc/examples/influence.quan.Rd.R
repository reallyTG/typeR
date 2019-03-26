library(fda.usc)


### Name: influence.quan
### Title: Quantile for influence measures
### Aliases: influence.quan
### Keywords: outliers

### ** Examples

## Not run: 
##D data(tecator)
##D x=tecator$absorp.fdata
##D y=tecator$y$Fat
##D res=fregre.pc(x,y,1:6)
##D 
##D #time consuming
##D res.infl=influence.fdata(res)
##D resquan=influence.quan(res,res.infl,4,0.01,0.05,0.95)
##D plot(res.infl$betas,type="l",col=2)
##D lines(res$beta.est,type="l",col=3)
##D lines(resquan$betas.boot,type="l",col="gray")
##D 
##D res=fregre.basis(x,y)
##D res.infl=influence.fdata(res)
##D resquan=influence.quan(res,res.infl,mue.boot=4,kmax.fix=T)
##D plot(resquan$betas.boot,type="l",col=4)
##D lines(res.infl$betas,type="l",col=2)
##D lines(resquan$betas.boot,type="l",col="gray")
## End(Not run)



