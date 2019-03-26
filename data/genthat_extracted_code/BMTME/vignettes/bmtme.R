## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(BMTME)
data('WheatToy')

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(head(phenoWheatToy))

## ------------------------------------------------------------------------
phenoWheatToy <- phenoWheatToy[order(phenoWheatToy$Env, phenoWheatToy$Gid),]

## ------------------------------------------------------------------------
LG <- cholesky(genoWheatToy)
ZG <- model.matrix(~0 + as.factor(phenoWheatToy$Gid))
Z.G <- ZG %*% LG
Z.E <- model.matrix(~0 + as.factor(phenoWheatToy$Env))
ZEG <- model.matrix(~0 + as.factor(phenoWheatToy$Gid):as.factor(phenoWheatToy$Env))
G2 <- kronecker(diag(length(unique(phenoWheatToy$Env))), data.matrix(genoWheatToy))
LG2 <- cholesky(G2)
Z.EG <- ZEG %*% LG2
Y <- as.matrix(phenoWheatToy[, -c(1, 2)])

## ------------------------------------------------------------------------
fm <- BMTME(Y = Y, X = Z.E, Z1 = Z.G, Z2 = Z.EG, nIter = 1250, burnIn = 500, thin = 2,
            bs = 50, progressBar = FALSE)

## ------------------------------------------------------------------------
str(fm)

## ------------------------------------------------------------------------
COV_TraitGenetic <- fm$varTrait
COV_TraitGenetic

## ------------------------------------------------------------------------
COR_TraitGenetic <- cov2cor(COV_TraitGenetic)
COR_TraitGenetic

## ------------------------------------------------------------------------
COV_EnvGenetic <- fm$varEnv
COV_EnvGenetic

## ------------------------------------------------------------------------
COR_EnvGenetic <- cov2cor(COV_EnvGenetic)
COR_EnvGenetic

## ------------------------------------------------------------------------
COV_ResGenetic <- fm$vare
COV_ResGenetic

## ------------------------------------------------------------------------
COR_ResGenetic <- cov2cor(COV_ResGenetic)
COR_ResGenetic

## ------------------------------------------------------------------------
plot(fm, trait = 'DTHD')

## ------------------------------------------------------------------------
pheno <- data.frame(GID = phenoWheatToy[, 1], Env = phenoWheatToy[, 2],
                    Response = phenoWheatToy[, 3])
CrossV <- CV.RandomPart(pheno, NPartitions = 4, PTesting = 0.2, set_seed = 123)

## ------------------------------------------------------------------------
pm <- BMTME(Y = Y, X = Z.E, Z1 = Z.G, Z2 = Z.EG, nIter = 1250, burnIn = 500, thin = 2,
            bs = 50, testingSet = CrossV)
summary(pm)

## ------------------------------------------------------------------------
boxplot(pm, select = "MAAPE")

