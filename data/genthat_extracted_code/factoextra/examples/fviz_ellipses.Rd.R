library(factoextra)


### Name: fviz_ellipses
### Title: Draw confidence ellipses around the categories
### Aliases: fviz_ellipses

### ** Examples

## No test: 

# Multiple Correspondence Analysis
# +++++++++++++++++++++++++++++++++
library(FactoMineR)
data(poison)
res.mca <- MCA(poison, quanti.sup = 1:2, 
              quali.sup = 3:4, graph=FALSE)
              
fviz_ellipses(res.mca, 1:4, geom = "point",
palette = "jco") 

 
## End(No test)



