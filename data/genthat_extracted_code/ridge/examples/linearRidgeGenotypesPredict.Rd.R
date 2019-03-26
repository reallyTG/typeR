library(ridge)


### Name: linearRidgeGenotypesPredict
### Title: Predict phenotypes from genome-wide SNP data based on a file of
###   coefficients
### Aliases: linearRidgeGenotypesPredict

### ** Examples

## Not run: 
##D genotypesfile <- system.file("extdata","GenCont_genotypes.txt",package = "ridge")
##D phenotypesfile <- system.file("extdata","GenCont_phenotypes.txt",package = "ridge")
##D betafile <- tempfile(pattern = "beta", fileext = ".dat")
##D beta_linearRidgeGenotypes <- linearRidgeGenotypes(genotypesfilename = genotypesfile,
##D                                                       phenotypesfilename = phenotypesfile,
##D                                                       betafilename = betafile)
##D pred_phen_geno <- linearRidgeGenotypesPredict(genotypesfilename = genotypesfile,
##D                                                     betafilename = betafile)
##D ## compare to output of linearRidge
##D data(GenCont) ## Same data as in GenCont_genotypes.txt and GenCont_phenotypes.txt
##D beta_linearRidge <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
##D pred_phen <- predict(beta_linearRidge)
##D print(cbind(pred_phen_geno, pred_phen))
##D ## Delete the temporary betafile
##D unlink(betafile)
## End(Not run)



