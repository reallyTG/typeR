library(factoextra)


### Name: fviz_pca
### Title: Visualize Principal Component Analysis
### Aliases: fviz_pca fviz_pca_ind fviz_pca_var fviz_pca_biplot

### ** Examples

## No test: 
# Principal component analysis
# ++++++++++++++++++++++++++++++
data(iris)
res.pca <- prcomp(iris[, -5],  scale = TRUE)

# Graph of individuals
# +++++++++++++++++++++

# Default plot
# Use repel = TRUE to avoid overplotting (slow if many points)
fviz_pca_ind(res.pca, col.ind = "#00AFBB",
   repel = TRUE)

 
# 1. Control automatically the color of individuals 
   # using the "cos2" or the contributions "contrib"
   # cos2 = the quality of the individuals on the factor map
# 2. To keep only point or text use geom = "point" or geom = "text".
# 3. Change themes using ggtheme: http://www.sthda.com/english/wiki/ggplot2-themes

fviz_pca_ind(res.pca, col.ind="cos2", geom = "point",
   gradient.cols = c("white", "#2E9FDF", "#FC4E07" ))

# Color individuals by groups, add concentration ellipses
# Change group colors using RColorBrewer color palettes
# Read more: http://www.sthda.com/english/wiki/ggplot2-colors
# Remove labels: label = "none".
fviz_pca_ind(res.pca, label="none", habillage=iris$Species,
     addEllipses=TRUE, ellipse.level=0.95, palette = "Dark2")
             
     
# Change group colors manually
# Read more: http://www.sthda.com/english/wiki/ggplot2-colors
fviz_pca_ind(res.pca, label="none", habillage=iris$Species,
     addEllipses=TRUE, ellipse.level=0.95,
     palette = c("#999999", "#E69F00", "#56B4E9"))
      
# Select and visualize some individuals (ind) with select.ind argument.
 # - ind with cos2 >= 0.96: select.ind = list(cos2 = 0.96)
 # - Top 20 ind according to the cos2: select.ind = list(cos2 = 20)
 # - Top 20 contributing individuals: select.ind = list(contrib = 20)
 # - Select ind by names: select.ind = list(name = c("23", "42", "119") )
 
 # Example: Select the top 40 according to the cos2
fviz_pca_ind(res.pca, select.ind = list(cos2 = 40))

 
# Graph of variables
# ++++++++++++++++++++++++++++
  
# Default plot
fviz_pca_var(res.pca, col.var = "steelblue")
 
# Control variable colors using their contributions
fviz_pca_var(res.pca, col.var = "contrib", 
   gradient.cols = c("white", "blue", "red"),
   ggtheme = theme_minimal())
 
    
# Biplot of individuals and variables
# ++++++++++++++++++++++++++
# Keep only the labels for variables
# Change the color by groups, add ellipses
fviz_pca_biplot(res.pca, label = "var", habillage=iris$Species,
               addEllipses=TRUE, ellipse.level=0.95,
               ggtheme = theme_minimal())

 
## End(No test)
 



