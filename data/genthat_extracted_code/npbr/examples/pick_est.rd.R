library(npbr)


### Name: pick_est
### Title: Local Pickands' frontier estimator
### Aliases: pick_est
### Keywords: nonparametric

### ** Examples

## Not run: 
##D data("green")
##D plot(log(OUTPUT)~log(COST), data=green)
##D x <- seq(min(log(green$COST)), max(log(green$COST)), length.out=101)
##D h=0.5
##D nx<-unlist(lapply(x,function(y) length(which(abs(log(green$COST)-y)<=h))))
##D k<-trunc(nx^0.1)
##D lines(x, pick_est(log(green$COST), log(green$OUTPUT), x, h=h, k=k), lty=1, col="red")
## End(Not run)



