library(ridge)


### Name: logisticRidgeGenotypes
### Title: Fits logistic ridge regression models for genomoe-wide SNP data.
### Aliases: logisticRidgeGenotypes

### ** Examples

## Not run: 
##D     genotypesfile <- system.file("extdata","GenBin_genotypes.txt",package = "ridge")
##D     phenotypesfile <- system.file("extdata","GenBin_phenotypes.txt",package = "ridge")
##D     beta_logisticRidgeGenotypes <-
##D logisticRidgeGenotypes(genotypesfilename = genotypesfile, phenotypesfilename = phenotypesfile)
##D     ## compare to output of logisticRidge
##D     data(GenBin) ## Same data as in GenBin_genotypes.txt and GenBin_phenotypes.txt
##D     beta_logisticRidge <- logisticRidge(Phenotypes ~ ., data = as.data.frame(GenBin))
##D     cbind(round(coef(beta_logisticRidge), 6), beta_logisticRidgeGenotypes)
## End(Not run)
  


