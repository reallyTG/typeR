library(ade4)


### Name: wca.coinertia
### Title: Within-class coinertia analysis
### Aliases: wca.coinertia
### Keywords: multivariate

### ** Examples

data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 4)
pca2 <- dudi.pca(meaudret$spe, scal = FALSE, scan = FALSE, nf = 4)
   
wit1 <- wca(pca1, meaudret$design$site, scan = FALSE, nf = 2)
wit2 <- wca(pca2, meaudret$design$site, scan = FALSE, nf = 2)
coiw <- coinertia(wit1, wit2, scannf = FALSE)

coi <- coinertia(pca1, pca2, scannf = FALSE, nf = 3)
coi.w <- wca(coi, meaudret$design$site, scannf = FALSE)
## coiw and coi.w are equivalent

plot(coi.w)



