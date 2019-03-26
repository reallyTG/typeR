library(fclust)


### Name: summary.fclust
### Title: Summarizing fuzzy clustering output
### Aliases: summary.fclust
### Keywords: multivariate

### ** Examples

## unemployment data
data(unemployment)
## fuzzy k-means
unempFKM=FKM(unemployment,k=3,stand=1)
summary(unempFKM)



