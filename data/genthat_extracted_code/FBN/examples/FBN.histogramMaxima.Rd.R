library(FBN)


### Name: FBN.histogramMaxima
### Title: Local maxima of the histogram of SNP microarray data
### Aliases: FBN.histogramMaxima

### ** Examples

require(stats)
require(graphics)

x = c(rnorm(1000, 1, .2), rnorm(1000, 2, .2))
y = FBN.histogramMaxima(x, minSpan = .1)
h = hist(x)
par(new = TRUE)
plot(y,vector(mode=mode(y), length = length(y)), xlim = c(min(h$breaks), 
 	max(h$breaks)), ylim = c(0,max(h$counts)), xlab = NA, ylab = NA, 
 	col = 'red' )


x = c(1, 2, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 10, 10, 10, 11)
y = FBN.histogramMaxima(x, minSpan = 3, breaksData = 100)
h = hist(x, 100)
par(new = TRUE)
plot(y,vector(mode=mode(y), length = length(y)), xlim = c(min(h$breaks), 
 	max(h$breaks)), ylim = c(0,max(h$counts)), xlab = NA, ylab = NA, 
 	col = 'red' )



