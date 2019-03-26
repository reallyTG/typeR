library(broman)


### Name: manyboxplot
### Title: Boxplot-like figure for many groups
### Aliases: manyboxplot
### Keywords: graphics

### ** Examples

## Don't show: 
set.seed(8422668)
## End(Don't show)
mu <- c(rnorm(50, 0, 0.3), rnorm(50, 2, 0.3)) # vector of means
x <- t(matrix(rnorm(1000*100, mu), ncol=1000))
manyboxplot(x, c(0.05, 0.25), ylim=range(x),
           dotcol=c("blue","green")[(1:100 > 50) + 1],
           hlines=seq(-4, 6, by=2),
           vlines=c(1, seq(20, 100, by=20)))




