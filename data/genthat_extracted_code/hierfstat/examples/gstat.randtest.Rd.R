library(hierfstat)


### Name: gstat.randtest
### Title: Goudet's G-statistic Monte Carlo test for genind object
### Aliases: gstat.randtest
### Keywords: manip multivariate

### ** Examples

## Not run: 
##D if(require(adegenet)){
##D # here the example of g.stats.glob is taken using gstat.randtest
##D data(gtrunchier)
##D x <- df2genind(X=gtrunchier[,-c(1,2)],pop=gtrunchier$Patch)
##D 
##D # test in hierfstat
##D gtr.test<- g.stats.glob(gtrunchier[,-1])
##D gtr.test
##D 
##D # randtest version
##D x.gtest <- gstat.randtest(x,nsim=99)
##D x.gtest
##D plot(x.gtest)
##D 
##D # pop within sup.pop test
##D gstat.randtest(x,nsim=99,method="within",sup.pop=gtrunchier$Locality)
##D 
##D # pop test with sub.pop kept constant
##D gstat.randtest(x,nsim=99,pop=gtrunchier$Locality,method="between",sub.pop=gtrunchier$Patch)
##D }
## End(Not run)



