library(BMTME)


### Name: BMORS
### Title: Bayesian Multi-Output Regression Stacking (BMORS)
### Aliases: BMORS

### ** Examples

## No test: 
data("WheatToy")
phenoWheatToy <- phenoWheatToy[order(phenoWheatToy$Env, phenoWheatToy$Gid),]

#Matrix Design
LG <- cholesky(genoWheatToy)
ZG <- model.matrix(~0 + as.factor(phenoWheatToy$Gid))
Z.G <- ZG %*% LG

#Linear Predictor
ETA <- list(Gen = list(X = Z.G, model = 'BRR'))

pheno <- phenoWheatToy[, c(1:3)] #Use only the first trait to do a cv
colnames(pheno) <- c('Line', 'Env', 'Response')
CrossValidation <- CV.RandomPart(pheno, NPartitions = 10, PTesting = 0.2, set_seed = 123)

#Pheno
Y <- as.matrix(phenoWheatToy[, c(3,4)])
#Check predictive capacities of the model
pm <- BMORS(Y, ETA = ETA, nIter = 10000, burnIn = 5000, thin = 2,
            testingSet = CrossValidation,  digits = 4)
## End(No test)



