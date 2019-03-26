library(bio3d)


### Name: pca.pdbs
### Title: Principal Component Analysis
### Aliases: pca.pdbs
### Keywords: utilities multivariate

### ** Examples


attach(transducin)

#-- Do PCA ignoring gap containing positions
pc.xray <- pca(pdbs)

# Plot results (conformer plots & scree plot)
plot(pc.xray, col=annotation[, "color"])

detach(transducin)




