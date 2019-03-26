library(compositions)


### Name: ccompgof
### Title: Compositional Goodness of fit test
### Aliases: PoissonGOF.test ccompPoissonGOF.test ccompMultinomialGOF.test
### Keywords: htest

### ** Examples

## Not run: 
##D x <- runif.acomp(100,4)
##D y <- runif.acomp(100,4)
##D 
##D erg <- acompGOF.test(x,y)
##D #continue
##D erg
##D unclass(erg)
##D erg <- acompGOF.test(x,y)
##D 
##D 
##D x <- runif.acomp(100,4)
##D y <- runif.acomp(100,4)
##D dd <- replicate(1000,acompGOF.test(runif.acomp(100,4),runif.acomp(100,4))$p.value)
##D hist(dd)
##D 
##D dd <- replicate(1000,acompGOF.test(runif.acomp(20,4),runif.acomp(100,4))$p.value)
##D hist(dd)
##D dd <- replicate(1000,acompGOF.test(runif.acomp(10,4),runif.acomp(100,4))$p.value)
##D 
##D hist(dd)
##D dd <- replicate(1000,acompGOF.test(runif.acomp(10,4),runif.acomp(400,4))$p.value)
##D hist(dd)
##D dd <- replicate(1000,acompGOF.test(runif.acomp(400,4),runif.acomp(10,4),bandwidth=4)$p.value)
##D hist(dd)
##D 
##D 
##D dd <- replicate(1000,acompGOF.test(runif.acomp(20,4),runif.acomp(100,4)+acomp(c(1,2,3,1)))$p.value)
##D 
##D hist(dd)
##D 
##D 
##D x <- runif.acomp(100,4)
##D acompUniformityGOF.test(x)
##D 
##D dd <- replicate(1000,acompUniformityGOF.test(runif.acomp(10,4))$p.value)
##D 
##D hist(dd)
##D 
## End(Not run)



