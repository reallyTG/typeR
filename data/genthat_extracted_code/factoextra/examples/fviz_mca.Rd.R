library(factoextra)


### Name: fviz_mca
### Title: Visualize Multiple Correspondence Analysis
### Aliases: fviz_mca fviz_mca_ind fviz_mca_var fviz_mca_biplot fviz_mca

### ** Examples

# Multiple Correspondence Analysis
# ++++++++++++++++++++++++++++++
# Install and load FactoMineR to compute MCA
# install.packages("FactoMineR")
library("FactoMineR")
data(poison)
poison.active <- poison[1:55, 5:15]
head(poison.active)
res.mca <- MCA(poison.active, graph=FALSE)

# Graph of individuals
# +++++++++++++++++++++

# Default Plot
# Color of individuals: col.ind = "steelblue"
fviz_mca_ind(res.mca, col.ind = "steelblue")

# 1. Control automatically the color of individuals 
   # using the "cos2" or the contributions "contrib"
   # cos2 = the quality of the individuals on the factor map
# 2. To keep only point or text use geom = "point" or geom = "text".
# 3. Change themes: http://www.sthda.com/english/wiki/ggplot2-themes

fviz_mca_ind(res.mca, col.ind = "cos2", repel = TRUE)

## Not run: 
##D      
##D # You can also control the transparency 
##D # of the color by the cos2
##D fviz_mca_ind(res.mca, alpha.ind="cos2") 
## End(Not run)
     
# Color individuals by groups, add concentration ellipses
# Remove labels: label = "none".
grp <- as.factor(poison.active[, "Vomiting"])
p <- fviz_mca_ind(res.mca, label="none", habillage=grp,
       addEllipses=TRUE, ellipse.level=0.95)
print(p)
      
    
# Change group colors using RColorBrewer color palettes
# Read more: http://www.sthda.com/english/wiki/ggplot2-colors
p + scale_color_brewer(palette="Dark2") +
    scale_fill_brewer(palette="Dark2") 
     
# Change group colors manually
# Read more: http://www.sthda.com/english/wiki/ggplot2-colors
p + scale_color_manual(values=c("#999999", "#E69F00"))+
 scale_fill_manual(values=c("#999999", "#E69F00"))
             
             
# Select and visualize some individuals (ind) with select.ind argument.
 # - ind with cos2 >= 0.4: select.ind = list(cos2 = 0.4)
 # - Top 20 ind according to the cos2: select.ind = list(cos2 = 20)
 # - Top 20 contributing individuals: select.ind = list(contrib = 20)
 # - Select ind by names: select.ind = list(name = c("44", "38", "53",  "39") )
 
# Example: Select the top 40 according to the cos2
fviz_mca_ind(res.mca, select.ind = list(cos2 = 20))

 
# Graph of variable categories
# ++++++++++++++++++++++++++++
# Default plot: use repel = TRUE to avoid overplotting
fviz_mca_var(res.mca, col.var = "#FC4E07")

# Control variable colors using their contributions
# use repel = TRUE to avoid overplotting
fviz_mca_var(res.mca, col.var = "contrib",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"))
        
    
# Biplot
# ++++++++++++++++++++++++++
grp <- as.factor(poison.active[, "Vomiting"])
fviz_mca_biplot(res.mca, repel = TRUE, col.var = "#E7B800",
 habillage = grp, addEllipses = TRUE, ellipse.level = 0.95)
 
 ## Not run: 
##D # Keep only the labels for variable categories: 
##D fviz_mca_biplot(res.mca, label ="var")
##D 
##D # Keep only labels for individuals
##D fviz_mca_biplot(res.mca, label ="ind")
##D 
##D # Hide variable categories
##D fviz_mca_biplot(res.mca, invisible ="var")
##D 
##D # Hide individuals
##D fviz_mca_biplot(res.mca, invisible ="ind")
##D 
##D # Control automatically the color of individuals using the cos2
##D fviz_mca_biplot(res.mca, label ="var", col.ind="cos2")
##D        
##D # Change the color by groups, add ellipses
##D fviz_mca_biplot(res.mca, label="var", col.var ="blue",
##D    habillage=grp, addEllipses=TRUE, ellipse.level=0.95)
##D                
##D # Select the top 30 contributing individuals
##D # And the top 10 variables
##D fviz_mca_biplot(res.mca,  
##D                select.ind = list(contrib = 30),
##D                select.var = list(contrib = 10)) 
## End(Not run)




