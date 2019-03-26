library(fclust)


### Name: VIFCR
### Title: Visual inspection of fuzzy clustering results
### Aliases: VIFCR
### Keywords: multivariate

### ** Examples

## unemployment data
data(unemployment)
## fuzzy k-means
unempFKM=FKM(unemployment,k=3,stand=1)
## all plots
VIFCR(unempFKM)
## plots 1 and 3
VIFCR(unempFKM,c(1,3))



