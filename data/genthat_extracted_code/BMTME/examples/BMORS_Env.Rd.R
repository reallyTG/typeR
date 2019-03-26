library(BMTME)


### Name: BMORS_Env
### Title: Bayesian Multi-Output regression stacking for specific
###   environment estimations
### Aliases: BMORS_Env

### ** Examples

## No test: 
data('MaizeToy')
phenoMaizeToy <- phenoMaizeToy[order(phenoMaizeToy$Env, phenoMaizeToy$Line),]

#Matrix design
LG <- cholesky(genoMaizeToy)
ZG <- model.matrix(~0 + as.factor(phenoMaizeToy$Line))
Z.G <- ZG %*% LG
#Linear Predictor
ETA <- list(Gen = list(X = Z.G, model = 'BRR'))

dataset <- phenoMaizeToy[, 2:5] #Must Include in the first column the environments
#Check predictive capacities of the model
pm <- BMORS_Env(dataset, testingEnv = 'EBU', ETA = ETA, covModel = 'BRR', nIter = 10000,
                burnIn = 5000, thin = 2, progressBar = FALSE, digits = 3)
## End(No test)




