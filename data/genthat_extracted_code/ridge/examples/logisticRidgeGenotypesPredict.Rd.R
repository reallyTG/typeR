library(ridge)


### Name: logisticRidgeGenotypesPredict
### Title: Predict fitted probabilities from genome-wide SNP data based on
###   a file of coefficients
### Aliases: logisticRidgeGenotypesPredict

### ** Examples

## Not run: 
##D genotypesfile <- system.file("extdata","GenBin_genotypes.txt",package = "ridge")
##D phenotypesfile <- system.file("extdata","GenBin_phenotypes.txt",package = "ridge")
##D betafile <- tempfile(pattern = "beta", fileext = ".dat")
##D beta_logisticRidgeGenotypes <- logisticRidgeGenotypes(genotypesfilename = genotypesfile,
##D                                                       phenotypesfilename = phenotypesfile,
##D                                                       betafilename = betafile)
##D pred_phen_geno <- logisticRidgeGenotypesPredict(genotypesfilename = genotypesfile,
##D                                                     betafilename = betafile)
##D ## compare to output of logisticRidge
##D data(GenBin) ## Same data as in GenBin_genotypes.txt and GenBin_phenotypes.txt
##D beta_logisticRidge <- logisticRidge(Phenotypes ~ ., data = as.data.frame(GenBin))
##D pred_phen <- predict(beta_logisticRidge, type="response")
##D print(cbind(pred_phen_geno, pred_phen))
##D ## Delete the temporary betafile
##D unlink(betafile)
## End(Not run)



