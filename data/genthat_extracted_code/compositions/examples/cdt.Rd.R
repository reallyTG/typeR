library(compositions)


### Name: cdt
### Title: Centered default transform
### Aliases: cdt cdt.default cdt.acomp cdt.rcomp cdt.aplus cdt.rplus
###   cdt.rmult cdt.ccomp cdt.factor cdtInv cdtInv.default cdtInv.acomp
###   cdtInv.rcomp cdtInv.aplus cdtInv.rplus cdtInv.rmult cdtInv.ccomp
###   cdtInv.factor
### Keywords: multivariate

### ** Examples

## Not run: 
##D # the cdt is defined by
##D cdt         <- function(x) UseMethod("cdt",x)
##D cdt.default <- function(x) x
##D cdt.acomp   <- clr 
##D cdt.rcomp   <- cpt 
##D cdt.aplus   <- ilt 
##D cdt.rplus   <- iit 
## End(Not run)
x <- acomp(1:5)
(ds <- cdt(x))
cdtInv(ds,x)
(ds <- cdt(rcomp(1:5)))
cdtInv(ds,rcomp(x))
  data(Hydrochem)
  x = Hydrochem[,c("Na","K","Mg","Ca")]
  y = acomp(x)
  z = cdt(y)
  y2 = cdtInv(z,y)
  par(mfrow=c(2,2))
  for(i in 1:4){plot(y[,i],y2[,i])}




