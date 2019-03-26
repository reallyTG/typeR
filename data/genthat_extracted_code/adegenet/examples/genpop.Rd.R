library(adegenet)


### Name: genpop class
### Title: adegenet formal class (S4) for allele counts in populations
### Aliases: genpop-class dist,genpop,ANY,ANY,ANY,missing-method
###   names,genpop-method show,genpop-method summary,genpop-method
###   print,genpopSummary-method print.genpopSummary is.genpop
### Keywords: classes manip multivariate

### ** Examples

obj1 <- import2genind(system.file("files/nancycats.gen",
package="adegenet"))
obj1


obj2 <- genind2genpop(obj1)
obj2

## Not run: 
##D data(microsatt)
##D # use as.genpop to convert convenient count tab to genpop
##D obj3 <- as.genpop(microsatt$tab)
##D obj3
##D 
##D all(obj3@tab==microsatt$tab)
##D 
##D # perform a correspondance analysis
##D obj4 <- genind2genpop(obj1,missing="chi2")
##D ca1 <- dudi.coa(as.data.frame(obj4@tab),scannf=FALSE)
##D s.label(ca1$li,sub="Correspondance Analysis",csub=2)
##D add.scatter.eig(ca1$eig,2,xax=1,yax=2,posi="top")
##D 
## End(Not run)



