library(compositions)


### Name: gof
### Title: Compositional Goodness of fit test
### Aliases: acompGOF.test acompGOF.test.list acompGOF.test.formula
###   gsi.acompUniformityGOF.test acompNormalGOF.test
###   acompTwoSampleGOF.test
### Keywords: htest

### ** Examples

## Not run: 
##D x <- runif.acomp(100,4)
##D y <- runif.acomp(100,4)
##D 
##D erg <- acompTwoSampleGOF.test(x,y)
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
##D # test uniformity
##D 
##D attach("gsi") # the uniformity test is only available as an internal function
##D x <- runif.acomp(100,4)
##D gsi.acompUniformityGOF.test.test(x)
##D 
##D dd <- replicate(1000,gsi.acompUniformityGOF.test.test(runif.acomp(10,4))$p.value)
##D hist(dd)
##D detach("gsi")
##D 
## End(Not run)



