library(adegenet)


### Name: nancycats
### Title: Microsatellites genotypes of 237 cats from 17 colonies of Nancy
###   (France)
### Aliases: nancycats
### Keywords: datasets

### ** Examples


## Not run: 
##D data(nancycats)
##D nancycats
##D 
##D # summary's results are stored in x
##D x <- summary(nancycats)
##D 
##D # some useful graphics
##D barplot(x$loc.n.all,ylab="Alleles numbers",main="Alleles numbers
##D per locus")
##D 
##D plot(x$pop.eff,x$pop.nall,type="n",xlab="Sample size",ylab="Number of alleles")
##D text(x$pop.eff,y=x$pop.nall,lab=names(x$pop.nall))
##D 
##D par(las=3)
##D barplot(table(nancycats@pop),ylab="Number of genotypes",main="Number of genotypes per colony")
##D 
##D # are cats structured among colonies ?
##D if(require(hierfstat)){
##D 
##D gtest <- gstat.randtest(nancycats,nsim=99)
##D gtest
##D plot(gtest)
##D 
##D 
##D dat <- genind2hierfstat(nancycats)
##D 
##D Fstat <- varcomp.glob(dat$pop,dat[,-1])
##D Fstat
##D }
## End(Not run)




