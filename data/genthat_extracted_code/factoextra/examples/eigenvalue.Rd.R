library(factoextra)


### Name: eigenvalue
### Title: Extract and visualize the eigenvalues/variances of dimensions
### Aliases: eigenvalue get_eig get_eigenvalue fviz_eig fviz_screeplot

### ** Examples

# Principal Component Analysis
# ++++++++++++++++++++++++++
data(iris)
res.pca <- prcomp(iris[, -5],  scale = TRUE)

# Extract eigenvalues/variances
get_eig(res.pca)

# Default plot
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 85))
  
# Scree plot - Eigenvalues
fviz_eig(res.pca, choice = "eigenvalue", addlabels=TRUE)

# Use only bar  or line plot: geom = "bar" or geom = "line"
fviz_eig(res.pca, geom="line")
 
## Not run: 
##D          
##D # Correspondence Analysis
##D # +++++++++++++++++++++++++++++++++
##D library(FactoMineR)
##D data(housetasks)
##D res.ca <- CA(housetasks, graph = FALSE)
##D get_eig(res.ca)
##D fviz_eig(res.ca, linecolor = "#FC4E07",
##D    barcolor = "#00AFBB", barfill = "#00AFBB")
##D 
##D # Multiple Correspondence Analysis
##D # +++++++++++++++++++++++++++++++++
##D library(FactoMineR)
##D data(poison)
##D res.mca <- MCA(poison, quanti.sup = 1:2, 
##D               quali.sup = 3:4, graph=FALSE)
##D get_eig(res.mca)
##D fviz_eig(res.mca, linecolor = "#FC4E07",
##D    barcolor = "#2E9FDF", barfill = "#2E9FDF")
## End(Not run)




