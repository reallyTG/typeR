library(FactoMineR)


### Name: ellipseCA
### Title: Draw confidence ellipses in CA
### Aliases: ellipseCA
### Keywords: multivariate

### ** Examples

data(children)
res.ca <- CA (children, col.sup = 6:8, row.sup = 15:18)
## Ellipses for all the active elements
ellipseCA(res.ca)
## Ellipses around some columns only
ellipseCA(res.ca,ellipse="col",col.col.ell=c(rep("blue",2),rep("transparent",3)),
     invisible=c("row.sup","col.sup"))



