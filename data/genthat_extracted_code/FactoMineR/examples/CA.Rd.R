library(FactoMineR)


### Name: CA
### Title: Correspondence Analysis (CA)
### Aliases: CA
### Keywords: multivariate

### ** Examples

data(children)
res.ca <- CA (children, row.sup = 15:18, col.sup = 6:8)
summary(res.ca)
## Ellipses for all the active elements
ellipseCA(res.ca)
## Ellipses around some columns only
ellipseCA(res.ca,ellipse="col",col.col.ell=c(rep("blue",2),rep("transparent",3)),
     invisible=c("row.sup","col.sup"))



