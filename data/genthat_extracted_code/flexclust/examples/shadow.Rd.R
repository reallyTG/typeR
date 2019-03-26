library(flexclust)


### Name: shadow
### Title: Cluster Shadows and Silhouettes
### Aliases: shadow shadow,kccasimple-method show,shadow-method
###   plot,shadow,ANY-method Silhouette Silhouette,kcca-method
###   show,Silhouette-method plot,Silhouette,ANY-method
### Keywords: methods hplot

### ** Examples

data(Nclus)
set.seed(1)
c5 <- cclust(Nclus, 5, save.data=TRUE)
c5
plot(c5)

## high shadow values indicate clusters with *bad* separation
shadow(c5)
plot(shadow(c5))

## high Silhouette values indicate clusters with *good* separation
Silhouette(c5)
plot(Silhouette(c5))



