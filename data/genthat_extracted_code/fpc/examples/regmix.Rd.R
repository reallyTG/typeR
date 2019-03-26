library(fpc)


### Name: regmix
### Title: Mixture Model ML for Clusterwise Linear Regression
### Aliases: regmix regem
### Keywords: cluster regression

### ** Examples

## Not run: 
##D # This apparently gives slightly different
##D # but data-analytically fine results
##D # on some versions of R.
##D set.seed(12234)
##D data(tonedata)
##D attach(tonedata)
##D rmt1 <- regmix(stretchratio,tuned,nclust=1:2)
##D # nclust=1:2 makes the example fast;
##D # a more serious application would rather use the default.
##D rmt1$g
##D round(rmt1$bic,digits=2)
##D # start with initial parameter values
##D cln <- 3
##D n <- 150
##D initcoef <- cbind(c(2,0),c(0,1),c(0,2.5))
##D initvar <- c(0.001,0.0001,0.5)
##D initeps <- c(0.4,0.3,0.3)
##D # computation of m from initial parameters
##D m <- matrix(nrow=n, ncol=cln)
##D stm <- numeric(0)
##D for (i in 1:cln)
##D   for (j in 1:n){
##D     m[j,i] <- initeps[i]*dnorm(tuned[j],mean=initcoef[1,i]+
##D               initcoef[2,i]*stretchratio[j], sd=sqrt(initvar[i]))
##D   }
##D   for (j in 1:n){
##D     stm[j] <- sum(m[j,])
##D     for (i in 1:cln)
##D       m[j,i] <- m[j,i]/stm[j]
##D   } 
##D rmt2 <- regem(stretchratio, tuned, m, cln)
## End(Not run)



