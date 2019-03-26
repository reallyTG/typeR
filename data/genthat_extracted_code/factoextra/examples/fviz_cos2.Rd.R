library(factoextra)


### Name: fviz_cos2
### Title: Visualize the quality of representation of rows/columns
### Aliases: fviz_cos2

### ** Examples

## No test: 
# Principal component analysis
# ++++++++++++++++++++++++++
data(decathlon2)
decathlon2.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon2.active,  scale = TRUE)

# variable cos2 on axis 1
fviz_cos2(res.pca, choice="var", axes = 1, top = 10 )

# Change color
fviz_cos2(res.pca, choice="var", axes = 1,
         fill = "lightgray", color = "black") 
         
# Variable cos2 on axes 1 + 2
fviz_cos2(res.pca, choice="var", axes = 1:2)

# cos2 of individuals on axis 1
fviz_cos2(res.pca, choice="ind", axes = 1)

## Not run: 
##D # Correspondence Analysis
##D # ++++++++++++++++++++++++++
##D library("FactoMineR")
##D data("housetasks")
##D res.ca <- CA(housetasks, graph = FALSE)
##D 
##D # Visualize row cos2 on axes 1
##D fviz_cos2(res.ca, choice ="row", axes = 1)
##D # Visualize column cos2 on axes 1
##D fviz_cos2(res.ca, choice ="col", axes = 1)
##D 
##D # Multiple Correspondence Analysis
##D # +++++++++++++++++++++++++++++++++
##D library(FactoMineR)
##D data(poison)
##D res.mca <- MCA(poison, quanti.sup = 1:2, 
##D               quali.sup = 3:4, graph=FALSE)
##D               
##D # Visualize individual cos2 on axes 1
##D fviz_cos2(res.mca, choice ="ind", axes = 1, top = 20)
##D # Visualize variable categorie cos2 on axes 1
##D fviz_cos2(res.mca, choice ="var", axes = 1)
##D 
##D # Multiple Factor Analysis
##D # ++++++++++++++++++++++++
##D library(FactoMineR)
##D data(poison)
##D res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
##D                name.group=c("desc","desc2","symptom","eat"),
##D                num.group.sup=1:2, graph=FALSE)
##D # Visualize individual cos2 on axes 1
##D # Select the top 20
##D fviz_cos2(res.mfa, choice ="ind", axes = 1, top = 20)
##D # Visualize catecorical variable categorie cos2 on axes 1
##D fviz_cos2(res.mfa, choice ="quali.var", axes = 1)
## End(Not run)
               
 
## End(No test)



