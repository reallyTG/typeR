library(ClassDiscovery)


### Name: ClusterTest-class
### Title: Class "ClusterTest"
### Aliases: ClusterTest ClusterTest-class hist,ClusterTest-method
###   image,ClusterTest-method summary,ClusterTest-method
### Keywords: classes cluster htest multivariate

### ** Examples

showClass("ClusterTest")

## simulate data from two different classes
d1 <- matrix(rnorm(100*30, rnorm(100, 0.5)), nrow=100, ncol=30, byrow=FALSE)
d2 <- matrix(rnorm(100*20, rnorm(100, 0.5)), nrow=100, ncol=20, byrow=FALSE)
dd <- cbind(d1, d2)

## cluster the data
hc <- hclust(distanceMatrix(dd, 'pearson'), method='average')

## make a fake reproducibility matrix
fraud <- function(x) {
  new('ClusterTest', result=abs(cor(x)), call=match.call())
}

fake <- fraud(dd)
summary(fake)

hist(fake)

image(fake) # let heatmap compute a new dendrogram from the agreements

image(fake, dendrogram=hc) # use the actual dendrogram from the data

image(fake, dendrogram=hc, col=blueyellow(64)) # change the colors

## cleanup
rm(fake, fraud, hc, dd, d1, d2)



