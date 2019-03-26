library(solarius)


### Name: solarAssoc
### Title: Run association analysis.
### Aliases: solarAssoc

### ** Examples

### load data
data(dat50)
dim(phenodata)
dim(kin)
dim(genodata)

## Not run: 
##D ### basic (univariate) association model with a custom kinship
##D mod <- solarAssoc(trait~age+sex, phenodata,
##D   kinship = kin, snpdata = genodata)
##D mod$snpf # table of results for 50 SNPs
## End(Not run)



