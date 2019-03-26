library(distillery)


### Name: datagrabber
### Title: Get Original Data from an R Object
### Aliases: datagrabber
### Keywords: data manip

### ** Examples

## Not run: 
##D ## From the extRems (>= 2.0) package.
##D y <- rnorm(100, mean=40, sd=20)
##D y <- apply(cbind(y[1:99], y[2:100]), 1, max)
##D bl <- rep(1:3, each=33)
##D 
##D ydc <- decluster(y, quantile(y, probs=c(0.95)), r=1, blocks=bl)
##D 
##D yorig <- datagrabber(ydc)
##D all(y - yorig == 0)
##D 
## End(Not run)




