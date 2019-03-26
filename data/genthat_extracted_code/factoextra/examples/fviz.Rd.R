library(factoextra)


### Name: fviz
### Title: Visualizing Multivariate Analyse Outputs
### Aliases: fviz

### ** Examples

## No test: 
# Principal component analysis
# +++++++++++++++++++++++++++++
data(decathlon2)
decathlon2.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon2.active,  scale = TRUE)
fviz(res.pca, "ind") # Individuals plot
fviz(res.pca, "var") # Variables plot

# Correspondence Analysis
# ++++++++++++++++++++++++++
# Install and load FactoMineR to compute CA
# install.packages("FactoMineR")
library("FactoMineR")
data("housetasks")
res.ca <- CA(housetasks, graph = FALSE)
fviz(res.ca, "row") # Rows plot
fviz(res.ca, "col") # Columns plot

# Multiple Correspondence Analysis
# +++++++++++++++++++++++++++++++++
library(FactoMineR)
data(poison)
res.mca <- MCA(poison, quanti.sup = 1:2, 
              quali.sup = 3:4, graph=FALSE)
              
fviz(res.mca, "ind") # Individuals plot
fviz(res.mca, "var") # Variables plot

 
## End(No test)



