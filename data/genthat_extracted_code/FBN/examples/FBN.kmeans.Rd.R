library(FBN)


### Name: FBN.kmeans
### Title: K-Means clustering of SNP microarray data
### Aliases: FBN.kmeans

### ** Examples

	
require(stats)
require(graphics)
x = c(rnorm(1000, 1, .2), rnorm(1000, 2, .2))
y = FBN.kmeans(x, minSpan = .001)
h = hist(x)
par(new = TRUE)
plot(y$centers,vector(mode=mode(y$centers), length = length(y$centers)), 
	xlim = c(min(h$breaks), max(h$breaks)), ylim = c(0,max(h$counts)), 
	xlab = NA, ylab = NA, col = 'red' )
	



