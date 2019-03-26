library(BMTME)


### Name: CV.RandomPart
### Title: Cross-Validation with Random Partitions
### Aliases: CV.RandomPart

### ** Examples

## No test: 
  library(BMTME)
  data("WheatIranianToy")
  phenoIranianToy <- phenoIranianToy[order(phenoIranianToy$Env, phenoIranianToy$GID), ]
  pheno <- data.frame(GID = phenoIranianToy[, 1], Env = phenoIranianToy$Env,
                      Trait = rep(colnames(phenoIranianToy)[3:4], each = dim(phenoIranianToy)[1]),
                      Response = c(phenoIranianToy[, 3], phenoIranianToy[, 4]))

  CV.RandomPart(pheno)
  CV.RandomPart(pheno, NPartitions = 10)
  CV.RandomPart(pheno, Traits.testing = 'DTM')
  CV.RandomPart(pheno, NPartitions = 10, PTesting = .35)
  CV.RandomPart(pheno, NPartitions = 10, Traits.testing = 'DTH')
  CV.RandomPart(pheno, NPartitions = 10, PTesting = .35, set_seed = 5)
  CV.RandomPart(pheno, NPartitions = 10, PTesting = .35, Traits.testing = 'DTH')
  CV.RandomPart(pheno, NPartitions = 10, PTesting = .35, Traits.testing = 'DTM', set_seed = 5 )
## End(No test)



