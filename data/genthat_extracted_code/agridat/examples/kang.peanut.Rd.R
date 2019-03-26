library(agridat)


### Name: kang.peanut
### Title: Multi-environment trial of peanuts for 10 genotypes in 15
###   environments
### Aliases: kang.peanut
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(kang.peanut)
##D dat <- kang.peanut
##D 
##D # Table 5.1 of Kang et al. (Chapter 5 of Saxton)
##D require(reshape2)
##D round(acast(dat, env~gen, value.var='yield', fun=mean),2)
##D 
##D # GGE biplot of Kang, p. 82.
##D require(gge)
##D m1 <- gge(yield~gen*env, data=dat, scale=FALSE)
##D biplot(m1, flip=c(1,1), main="kang.peanut - GGE biplot")
##D 
## End(Not run)



