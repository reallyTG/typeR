library(textmineR)


### Name: CalcJSDivergence
### Title: Calculate Jensen-Shannon Divergence
### Aliases: CalcJSDivergence
### Keywords: distance functions

### ** Examples

x <- rchisq(n = 100, df = 8)
y <- x^2
CalcJSDivergence(x = x, y = y)

mymat <- rbind(x, y)
CalcJSDivergence(x = mymat)



