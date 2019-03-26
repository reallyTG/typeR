library(HardyWeinberg)


### Name: HWMissing
### Title: Test a bi-allelic marker for Hardy-Weinberg equilibrium in the
###   presence of missing genotype information.
### Aliases: HWMissing
### Keywords: misc

### ** Examples

data(Markers)
## Not run: 
##D set.seed(123)
##D Results <- HWMissing(Markers[,1],m=50,verbose=TRUE)$Res # no covariates, imputation assuming MCAR.
##D set.seed(123)
##D Results <- HWMissing(Markers[,1:3],m=50,verbose=TRUE)$Res # impute with two allele intensities.
##D set.seed(123)
##D Results <- HWMissing(Markers[,c(1,4,5)],m=50,verbose=TRUE)$Res # impute with two covariate SNPs
## End(Not run)



