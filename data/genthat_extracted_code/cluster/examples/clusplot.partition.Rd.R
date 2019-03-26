library(cluster)


### Name: clusplot
### Title: Bivariate Cluster Plot (of a Partitioning Object)
### Aliases: clusplot clusplot.partition
### Keywords: cluster hplot

### ** Examples
 ## For more, see ?clusplot.default

## generate 25 objects, divided into 2 clusters.
x <- rbind(cbind(rnorm(10,0,0.5), rnorm(10,0,0.5)),
           cbind(rnorm(15,5,0.5), rnorm(15,5,0.5)))
clusplot(pam(x, 2))
## add noise, and try again :
x4 <- cbind(x, rnorm(25), rnorm(25))
clusplot(pam(x4, 2))



