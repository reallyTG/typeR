library(BMTME)


### Name: BME
### Title: Bayesian Multi-Environment Model (BME)
### Aliases: BME

### ** Examples

## No test: 
  data("WheatMadaToy")
  phenoMada <- (phenoMada[order(phenoMada$GID),])

  #Matrix design
  LG <- cholesky(genoMada)
  ZG <- model.matrix(~0 + as.factor(phenoMada$GID))
  Z.G <- ZG %*% LG

  #Pheno data
  Y <- as.matrix(phenoMada[, -c(1)])
  # Check fitting
  fm <- BME(Y = Y, Z1 = Z.G, nIter = 10000, burnIn = 5000, thin = 2, bs = 50)

  # Check predictive capacities of the model with CrossValidation object
  pheno <- data.frame(GID = phenoMada[, 1], Env = '', Response = phenoMada[, 3])
  CrossV <- CV.RandomPart(pheno, NPartitions = 4, PTesting = 0.2, set_seed = 123)

  pm <- BME(Y = Y, Z1 = Z.G, nIter = 10000, burnIn = 5000, thin = 2, bs = 50, testingSet = CrossV)
## End(No test)




