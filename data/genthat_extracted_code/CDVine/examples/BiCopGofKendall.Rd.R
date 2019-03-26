library(CDVine)


### Name: BiCopGofKendall
### Title: Goodness-of-fit test based on Kendall's process for bivariate
###   copula data
### Aliases: BiCopGofKendall

### ** Examples

# sample from a Gaussian copula
par1 = 3
fam1 = 3
dat1 = BiCopSim(500,fam1,par1)

## Not run: 
##D # perform the goodness-of-fit test for the true copula
##D gof = BiCopGofKendall(dat1[,1],dat1[,2],fam1)
##D gof$p.value.CvM
##D gof$p.value.KS
##D 
##D # perform the goodness-of-fit test for the Frank copula
##D gof = BiCopGofKendall(dat1[,1],dat1[,2],5)
##D gof$p.value.CvM
##D gof$p.value.KS
## End(Not run)



