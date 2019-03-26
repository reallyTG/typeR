library(sjPlot)


### Name: sjp.pca
### Title: Plot PCA results
### Aliases: sjp.pca

### ** Examples

library(sjmisc)
data(efc)
# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")
# recveive last item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")

# manually compute PCA
pca <- prcomp(
  na.omit(efc[, start:end]),
  retx = TRUE,
  center = TRUE,
  scale. = TRUE
)
# plot results from PCA as circles, including Eigenvalue-diagnostic.
# note that this plot does not compute the Cronbach's Alpha
sjp.pca(pca, plot.eigen = TRUE, type = "circle", geom.size = 10)

# use data frame as argument, let sjp.pca() compute PCA
sjp.pca(efc[, start:end])
sjp.pca(efc[, start:end], type = "tile")





