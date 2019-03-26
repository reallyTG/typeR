library(c060)


### Name: plot.stabpath
### Title: function to plot a stability path
### Aliases: plot.stabpath
### Keywords: stability selection

### ** Examples

## Not run: 
##D #gaussian
##D set.seed(1234)
##D x=matrix(rnorm(100*1000,0,1),100,1000)
##D y <- x[1:100,1:1000]%*%c(rep(2,5),rep(-2,5),rep(.1,990))
##D res <- stabpath(y,x,weakness=1,mc.cores=2)
##D plot(res,error=.5,type='pfer')
## End(Not run)



