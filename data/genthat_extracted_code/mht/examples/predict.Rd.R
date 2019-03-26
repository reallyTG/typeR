library(mht)


### Name: predict
### Title: Predict a 'mht' or 'mht.order' object
### Aliases: predict.mht predict.mht.order

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D # mht
##D mod=mht(x,y,alpha=c(0.1,0.05),maxordre=15)
##D 
##D # predict without new data: gives the fitted values
##D pred=predict(mod)
##D 
##D # predict with new data
##D pred=predict(mod,newx=matrix(rnorm(40*20),40,20))
##D pred
## End(Not run)



