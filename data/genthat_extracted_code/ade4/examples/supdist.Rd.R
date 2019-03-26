library(ade4)


### Name: supdist
### Title: Projection of additional items in a PCO analysis
### Aliases: supdist
### Keywords: multivariate

### ** Examples

data(meau)
## Case 1: Supplementary items = subset of Active items
## Supplementary coordinates should be equal to Active coordinates
## PCO of active items (meau dataset has 6 sites and 10 variables)
envpca1 <- dudi.pca(meau$env, scannf = FALSE)
dAct <- dist(envpca1$tab)
pco1 <- dudi.pco(dAct, scannf = FALSE)
## Projection of rows 19:24 (winter season for the 6 sites)
## Supplementary items must be normalized
f1 <- function(w) (w - envpca1$cent) / envpca1$norm
envSup <- t(apply(meau$env[19:24, ], 1, f1))
envTot <- rbind.data.frame(envpca1$tab, envSup)
dTot <- dist(envTot)
fSA1 <- as.factor(rep(c("A", "S"), c(24, 6)))
cSup1 <- supdist(dTot, fSA1)
## Comparison (coordinates should be equal)
cSup1$coordSup[, 1:2]
pco1$li[19:24, ]

data(meaudret)
## Case 2: Supplementary items = new items
## PCO of active items (meaudret dataset has only 5 sites and 9 variables)
envpca2 <- dudi.pca(meaudret$env, scannf = FALSE)
dAct <- dist(envpca2$tab)
pco2 <- dudi.pco(dAct, scannf = FALSE)
## Projection of site 6 (four seasons, without Oxyg variable)
## Supplementary items must be normalized
f1 <- function(w) (w - envpca2$cent) / envpca2$norm
envSup <- t(apply(meau$env[seq(6, 24, 6), -5], 1, f1))
envTot <- rbind.data.frame(envpca2$tab, envSup)
dTot <- dist(envTot)
fSA2 <- as.factor(rep(c("A", "S"), c(20, 4)))
cSup2 <- supdist(dTot, fSA2)
## Supplementary items vs. real items
if(!adegraphicsLoaded()) {
 par(mfrow = c(1, 2))
 s.label(pco1$li)
 s.label(rbind.data.frame(pco2$li, cSup2$coordSup[, 1:2]))
} else {
 gl1 <- s.label(pco1$li, plabels.optim = TRUE)
 gl2 <- s.label(rbind.data.frame(pco2$li, cSup2$coordSup[, 1:2]),
  plabels.optim = TRUE)
 ADEgS(list(gl1, gl2))
}



