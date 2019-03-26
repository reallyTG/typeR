library(factoextra)


### Name: fviz_mclust
### Title: Plot Model-Based Clustering Results using ggplot2
### Aliases: fviz_mclust fviz_mclust_bic

### ** Examples


if(require("mclust")){

# Compute model-based-clustering 
require("mclust")
data("diabetes")
mc <- Mclust(diabetes[, -1])

# Visaulize BIC values
fviz_mclust_bic(mc)

# Visualize classification
fviz_mclust(mc, "classification", geom = "point")
}




