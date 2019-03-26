library(SensoMineR)


### Name: construct.axes
### Title: Coordinates of individuals and illustrative individuals for PCA
###   or MFA
### Aliases: construct.axes
### Keywords: multivariate

### ** Examples

## Example1: PCA 
data(chocolates)
donnee <- cbind.data.frame(sensochoc[,c(1,4,5:18)])
axe <- construct.axes(donnee, scale.unit = TRUE)
 
## Example2: MFA (two groups of variables)
data(chocolates) 
donnee <- cbind.data.frame(sensochoc[,c(1,4,5:18)])
axe <- construct.axes(donnee, group = c(6,8), 
    name.group = c("A-F","T-S"),scale.unit = TRUE)



