library(sparcl)


### Name: ColorDendrogram
### Title: Color the leaves in a hierarchical clustering dendrogram
### Aliases: ColorDendrogram

### ** Examples

# Generate 2-class data
set.seed(1)
x <- matrix(rnorm(100*20),ncol=20)
y <- c(rep(1,50),rep(2,50))
x[y==1,] <- x[y==1,]+2
# Perform hierarchical clustering
hc <- hclust(dist(x),method="complete")
# Plot
ColorDendrogram(hc,y=y,main="My Simulated Data",branchlength=3)



