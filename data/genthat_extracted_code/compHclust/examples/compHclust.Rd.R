library(compHclust)


### Name: compHclust
### Title: Complementary Hierarchical Clustering
### Aliases: compHclust
### Keywords: cluster regression

### ** Examples

## Creating example microarray data with rows as genes and columns as
## samples.  Rows 1-20 represent the 'strong' genes which differentiate
## samples 1-4 from samples 5-8.  Rows 31-50 represent the 'weak' genes
## which differentiate the odd numbered samples from the even numbered
## samples.
set.seed(4872)
x <- matrix(0,nrow=50,ncol=8)
x[1:20,1:4] <- 8
x[1:20,5:8] <- -8
x[31:50,c(1,3,5,7)] <- 4
x[31:50,-c(1,3,5,7)] <- -4
x <- x + matrix(rnorm(50*8),ncol=8)

## Hierarchically cluster the columns of x.
x.hc <- hclust(as.dist(1-cor(x)))

## Run complementary hierarchical clustering.
x.chc <- compHclust(x,x.hc)
xp <- x.chc$x.prime
x.gi <- x.chc$gene.imp

## Hierarchically cluster the columns of x'.
xp.hc <- hclust(as.dist(1-cor(xp)))
xp.gi <- compHclust(xp,xp.hc)$gene.imp

## We use the function 'compHclust.heatmap' to display the
## initial and complementary clusterings.
## The initial clustering.
compHclust.heatmap(x,x.hc,x.gi,d.title="Initial Clustering")
## The complementary clustering.
compHclust.heatmap(xp,xp.hc,xp.gi,d.title="Complementary Clustering")



