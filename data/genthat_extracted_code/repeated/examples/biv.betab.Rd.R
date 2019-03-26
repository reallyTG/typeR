library(repeated)


### Name: biv.betab
### Title: Bivariate Beta-binomial Regression Models
### Aliases: biv.betab
### Keywords: models

### ** Examples


y <- matrix(  c( 2, 1, 1,13,
		 4, 1, 3, 5,
		 3, 3, 1, 4,
		15, 8, 1, 6),ncol=4,byrow=TRUE)
first <- c(0,0,1,1)
second <- c(0,1,0,1)
self <- cbind(first,second)
other <- cbind(second,first)
biv.betab(y,cbind(self,other),p=c(-1,2,1,1))
# independence
biv.betab(y,cbind(self,other),p=c(-1,1,1),dep=FALSE)




