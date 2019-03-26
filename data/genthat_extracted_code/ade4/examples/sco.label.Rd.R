library(ade4)


### Name: sco.label
### Title: 1D plot of a numeric score with labels
### Aliases: sco.label
### Keywords: multivariate hplot

### ** Examples

data(meau)
envpca <- dudi.pca(meau$env, scannf=FALSE)
par(mfrow=c(2,1))
sco.label(envpca$l1[,1], row.names(envpca$l1), lim=c(-1,3.5))
sco.label(envpca$co[,1], row.names(envpca$co), reverse = TRUE, lim=c(-1,3.5))



