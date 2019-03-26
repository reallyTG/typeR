library(ecp)


### Name: e.divisive
### Title: ENERGY DIVISIVE
### Aliases: e.divisive
### Keywords: divisive hierarchical

### ** Examples

set.seed(100)
x1 = matrix(c(rnorm(100),rnorm(100,3),rnorm(100,0,2)))
y1 = e.divisive(X=x1,sig.lvl=0.05,R=199,k=NULL,min.size=30,alpha=1)
x2 = rbind(MASS::mvrnorm(100,c(0,0),diag(2)),
	MASS::mvrnorm(100,c(2,2),diag(2)))
y2 = e.divisive(X=x2,sig.lvl=0.05,R=499,k=NULL,min.size=30,alpha=1)



