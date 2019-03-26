library(dimRed)


### Name: plot_R_NX
### Title: plot_R_NX
### Aliases: plot_R_NX

### ** Examples


## define which methods to apply
embed_methods <- c("Isomap", "PCA")
## load test data set
data_set <- loadDataSet("3D S Curve", n = 1000)
## apply dimensionality reduction
data_emb <- lapply(embed_methods, function(x) embed(data_set, x))
names(data_emb) <- embed_methods
## plot the R_NX curves:
plot_R_NX(data_emb) +
    ggplot2::theme(legend.title = ggplot2::element_blank(),
                   legend.position = c(0.5, 0.1),
                   legend.justification = c(0.5, 0.1))




