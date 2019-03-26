library(BMTME)


### Name: BMTME
### Title: Bayes Multi-Trait Milti-Environment Model (BMTME)
### Aliases: BMTME BMTME-package

### ** Examples

## No test: 
  data("WheatIranianToy")

  # Matrix Design
  LG <- cholesky(genoIranianToy)
  ZG <- model.matrix(~0 + as.factor(phenoIranianToy$GID))
  Z.G <- ZG %*% LG
  Z.E <- model.matrix(~0 + as.factor(phenoIranianToy$Env))
  ZEG <- model.matrix(~0 + as.factor(phenoIranianToy$GID):as.factor(phenoIranianToy$Env))
  G2 <- kronecker(diag(length(unique(phenoIranianToy$Env))), data.matrix(genoIranianToy))
  LG2 <- cholesky(G2)
  Z.EG <- ZEG %*% LG2

  #Pheno
  Y <- as.matrix(phenoIranianToy[, -c(1, 2)])

  #Check fitting
  fm <- BMTME(Y = Y, X = Z.E, Z1 = Z.G, Z2 = Z.EG,
              nIter = 10000, burnIn = 5000, thin = 2, bs = 50)
  fm

  # Check predictive capacities of the model
  pheno <- data.frame(GID = phenoIranianToy[, 1],
                      Env = phenoIranianToy[, 2],
                      Response = phenoIranianToy[, 3])
  CrossV <- CV.RandomPart(pheno, NPartitions = 4, PTesting = 0.2, set_seed = 123)

  pm <- BMTME(Y = Y, X = Z.E, Z1 = Z.G, Z2 = Z.EG,
              nIter = 10000, burnIn = 5000, thin = 2,
              bs = 50, testingSet = CrossV)
  pm
## End(No test)




