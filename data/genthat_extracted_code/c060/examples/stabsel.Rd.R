library(c060)


### Name: stabsel
### Title: function to estimate a stable set of variables
### Aliases: stabsel
### Keywords: stability selection

### ** Examples

## Not run: 
##D #gaussian
##D set.seed(1234)
##D x=matrix(rnorm(100*1000,0,1),100,1000)
##D y <- x[1:100,1:1000]%*%c(rep(2,5),rep(-2,5),rep(.1,990))
##D res <- stabpath(y,x,weakness=1,mc.cores=2)
##D stabsel(res,error=0.05,type="pfer")
## End(Not run)


