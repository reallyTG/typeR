library(fclust)


### Name: VAT
### Title: Visual Assessment of (Cluster) Tendency
### Aliases: VAT
### Keywords: multivariate

### ** Examples

## McDonald's data
data(Mc)
names(Mc)
## data normalization by dividing the nutrition facts by the Serving Size (column 1)
for (j in 2:(ncol(Mc)-1))
Mc[,j]=Mc[,j]/Mc[,1]
## data standardization (after removing the column Serving Size)
Mc=scale(Mc[,1:(ncol(Mc)-1)],center=TRUE,scale=TRUE)[,]
## plot of VAT
VAT(Mc)



