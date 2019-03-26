## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(BMTME)
data('WheatToy')

## ------------------------------------------------------------------------
phenoWheatToy <- phenoWheatToy[order(phenoWheatToy$Env, phenoWheatToy$Gid),]

## ------------------------------------------------------------------------
LG <- cholesky(genoWheatToy)
ZG <- model.matrix(~0 + as.factor(phenoWheatToy$Gid))
Z.G <- ZG %*% LG

## ------------------------------------------------------------------------
ETA <- list(Gen = list(X = Z.G, model = 'BRR'))

## ------------------------------------------------------------------------
pheno <- phenoWheatToy[, c(1:3)] #Use only the first trait to do a cv
colnames(pheno) <- c('Line', 'Env', 'Response')

## ------------------------------------------------------------------------
CrossValidation <- CV.RandomPart(pheno, NPartitions = 4, PTesting = 0.2, set_seed = 123)

## ------------------------------------------------------------------------
Y <- as.matrix(phenoWheatToy[, c(3,4)])

## ------------------------------------------------------------------------
pm <- BMORS(Y, ETA = ETA, nIter = 5000, burnIn = 2000, thin = 2, progressBar = TRUE,
              testingSet = CrossValidation,  digits = 4)
summary(pm)

## ------------------------------------------------------------------------
Z.E <- model.matrix(~0 + as.factor(phenoWheatToy$Env))

## ------------------------------------------------------------------------
ETA2 <- list(Env = list(X = Z.E, model = "BRR"),
             Gen = list(X = Z.G, model = 'BRR'))

## ------------------------------------------------------------------------
pm <- BMORS(Y, ETA = ETA, nIter = 2000, burnIn = 1000, thin = 2, progressBar = TRUE,
              testingSet = CrossValidation,  digits = 4)
summary(pm)

## ------------------------------------------------------------------------
# Line effect (section 3.1.1)
LG <- cholesky(genoWheatToy)
ZG <- model.matrix(~0 + as.factor(phenoWheatToy$Gid))
Z.G <- ZG %*% LG

# Environment effect (section 3.1.2)
Z.E <- model.matrix(~0 + as.factor(phenoWheatToy$Env))

#Interaction effect
ZEG <- model.matrix(~0 + as.factor(phenoWheatToy$Gid):as.factor(phenoWheatToy$Env))
G2 <- kronecker(diag(length(unique(phenoWheatToy$Env))), data.matrix(genoWheatToy))
LG2 <- cholesky(G2)
Z.EG <- ZEG %*% LG2

## ------------------------------------------------------------------------
ETA3 <- list(Env = list(X = Z.E, model = "BRR"),
             Gen = list(X = Z.G, model = 'BRR'),
             EnvGen = list(X = Z.EG, model = "BRR"))

## ------------------------------------------------------------------------
pm <- BMORS(Y, ETA = ETA3, nIter = 2000, burnIn = 1000, thin = 2, progressBar = TRUE,
              testingSet = CrossValidation,  digits = 4)
summary(pm)

## ------------------------------------------------------------------------
par(mar = c(7, 4, 2, 1)) #Bottom, Left, Top, Right
boxplot(pm, las = 2)

