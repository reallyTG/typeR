library(factoextra)


### Name: fviz_contrib
### Title: Visualize the contributions of row/column elements
### Aliases: fviz_contrib fviz_pca_contrib

### ** Examples

## No test: 
# Principal component analysis
# ++++++++++++++++++++++++++
data(decathlon2)
decathlon2.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon2.active,  scale = TRUE)

# variable contributions on axis 1
fviz_contrib(res.pca, choice="var", axes = 1, top = 10 )

# Change theme and color
fviz_contrib(res.pca, choice="var", axes = 1,
         fill = "lightgray", color = "black") +
         theme_minimal() +
         theme(axis.text.x = element_text(angle=45))

# Variable contributions on axis 2
fviz_contrib(res.pca, choice="var", axes = 2)
# Variable contributions on axes 1 + 2
fviz_contrib(res.pca, choice="var", axes = 1:2)

# Contributions of individuals on axis 1
fviz_contrib(res.pca, choice="ind", axes = 1)

## Not run: 
##D # Correspondence Analysis
##D # ++++++++++++++++++++++++++
##D # Install and load FactoMineR to compute CA
##D # install.packages("FactoMineR")
##D library("FactoMineR")
##D data("housetasks")
##D res.ca <- CA(housetasks, graph = FALSE)
##D 
##D # Visualize row contributions on axes 1
##D fviz_contrib(res.ca, choice ="row", axes = 1)
##D # Visualize column contributions on axes 1
##D fviz_contrib(res.ca, choice ="col", axes = 1)
##D 
##D # Multiple Correspondence Analysis
##D # +++++++++++++++++++++++++++++++++
##D library(FactoMineR)
##D data(poison)
##D res.mca <- MCA(poison, quanti.sup = 1:2,
##D               quali.sup = 3:4, graph=FALSE)
##D 
##D # Visualize individual contributions on axes 1
##D fviz_contrib(res.mca, choice ="ind", axes = 1)
##D # Visualize variable categorie contributions on axes 1
##D fviz_contrib(res.mca, choice ="var", axes = 1)
##D 
##D # Multiple Factor Analysis
##D # ++++++++++++++++++++++++
##D library(FactoMineR)
##D data(poison)
##D res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
##D                name.group=c("desc","desc2","symptom","eat"),
##D                num.group.sup=1:2, graph=FALSE)
##D 
##D # Visualize individual contributions on axes 1
##D fviz_contrib(res.mfa, choice ="ind", axes = 1, top = 20)
##D # Visualize catecorical variable categorie contributions on axes 1
##D fviz_contrib(res.mfa, choice ="quali.var", axes = 1)
## End(Not run)

 
## End(No test)



