library(ade4)


### Name: sco.gauss
### Title: Relationships between one score and qualitative variables
### Aliases: sco.gauss
### Keywords: multivariate hplot

### ** Examples

data(meau)
envpca <- dudi.pca(meau$env, scannf=FALSE)
dffac <- cbind.data.frame(meau$design$season, meau$design$site)
sco.gauss(envpca$li[,1], dffac, clabel = 2, csub = 2)



