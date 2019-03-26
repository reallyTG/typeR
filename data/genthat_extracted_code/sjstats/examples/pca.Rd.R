library(sjstats)


### Name: pca
### Title: Tidy summary of Principal Component Analysis
### Aliases: pca pca_rotate

### ** Examples

data(efc)
# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")
# recveive last item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")

# extract principal components
pca(efc[, start:end])

# extract principal components, varimax-rotation.
# number of components based on Kaiser-criteria
pca_rotate(efc[, start:end])




