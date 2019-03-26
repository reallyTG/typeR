library(factoextra)


### Name: housetasks
### Title: House tasks contingency table
### Aliases: housetasks

### ** Examples

library(FactoMineR)
data(housetasks)
res.ca <- CA(housetasks, graph=FALSE)
fviz_ca_biplot(res.ca, repel = TRUE)+
theme_minimal()




