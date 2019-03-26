library(ridge)


### Name: linearRidgeGenotypes
### Title: Fits linear ridge regression models for genome-wide SNP data.
### Aliases: linearRidgeGenotypes

### ** Examples

## Not run: 
##D     genotypesfile <- system.file("extdata","GenCont_genotypes.txt",package = "ridge")
##D     phenotypesfile <- system.file("extdata","GenCont_phenotypes.txt",package = "ridge")
##D     beta_linearRidgeGenotypes <- linearRidgeGenotypes(genotypesfilename = genotypesfile,
##D phenotypesfilename = phenotypesfile)
##D     ## compare to output of linearRidge
##D     data(GenCont) ## Same data as in GenCont_genotypes.txt and GenCont_phenotypes.txt
##D     beta_linearRidge <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
##D     cbind(round(coef(beta_linearRidge), 6), beta_linearRidgeGenotypes)
## End(Not run)
  


