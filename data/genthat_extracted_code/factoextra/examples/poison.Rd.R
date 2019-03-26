library(factoextra)


### Name: poison
### Title: Poison
### Aliases: poison

### ** Examples

## No test: 
library(FactoMineR)
data(poison)
res.mca <- MCA(poison, quanti.sup = 1:2, quali.sup = c(3,4), 
   graph = FALSE)
fviz_mca_biplot(res.mca, repel = TRUE)+
theme_minimal()

## End(No test)




