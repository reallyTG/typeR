library(FBN)


### Name: FBN.valueCenter
### Title: The SNP normalization function
### Aliases: FBN.valueCenter

### ** Examples

require(stats)
require(graphics)
x = c(rnorm(1000, 1, .1), rnorm(1000, 1.5, .1))
y = FBN.valueCenter(x, normalizingValue = 1, nominalValueCN = 2, 
	logScale = FALSE)
par(mfrow = c(2, 1), new = FALSE)
h = hist(x)
par(new = TRUE)
plot(1, 0, col = 'red', xlim = c(min(h$breaks), max(h$breaks)), 
	ylim = c(0,max(h$counts)), xlab = NA, ylab = NA)
par(new = FALSE)
h = hist(y)
par(new = TRUE)
plot(2, 0, col = 'red', xlim = c(min(h$breaks), max(h$breaks)), 
	ylim = c(0,max(h$counts)), xlab = NA, ylab = NA)



