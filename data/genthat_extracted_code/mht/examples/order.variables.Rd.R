library(mht)


### Name: order.variables
### Title: Rank the variables
### Aliases: order.variables

### ** Examples

## Not run: 
##D x=matrix(rnorm(100*20),100,20)
##D beta=c(rep(2,5),rep(0,15))
##D y=x%*%beta+rnorm(100)
##D 
##D res.bolasso=order.variables(x,y,maxordre=15,ordre="bolasso")
##D res.pval=order.variables(x,y,ordre="pval")
##D res.FR=order.variables(x,y,maxordre=15,ordre="FR")
##D res.pval.hd=order.variables(x,y,maxordre=15,ordre="pval_hd")
##D 
## End(Not run)



