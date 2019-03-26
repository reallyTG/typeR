## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(BMTME)
data('MaizeToy')

## ------------------------------------------------------------------------
phenoMaizeToy <- phenoMaizeToy[order(phenoMaizeToy$Env, phenoMaizeToy$Line),]

## ------------------------------------------------------------------------
LG <- cholesky(genoMaizeToy)
ZG <- model.matrix(~0 + as.factor(phenoMaizeToy$Line))
Z.G <- ZG %*% LG

## ------------------------------------------------------------------------
ETA <- list(Gen = list(X = Z.G, model = 'BRR'))

## ------------------------------------------------------------------------
dataset <- phenoMaizeToy[, 2:5] #Must Include in the first column the environments

## ------------------------------------------------------------------------
pm <- BMORS_Env(dataset, testingEnv = 'EBU', ETA = ETA, covModel = 'BRR', nIter = 2000, 
                  burnIn = 1000, thin = 2, progressBar = TRUE, digits = 3)
summary(pm)

## ------------------------------------------------------------------------
barplot(pm)

## ------------------------------------------------------------------------
head(pm$results, 5)

