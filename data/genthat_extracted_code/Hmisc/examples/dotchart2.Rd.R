library(Hmisc)


### Name: dotchart2
### Title: Enhanced Dot Chart
### Aliases: dotchart2
### Keywords: hplot

### ** Examples

set.seed(135)
maj <- factor(c(rep('North',13),rep('South',13)))
g <- paste('Category',rep(letters[1:13],2))
n <- sample(1:15000, 26, replace=TRUE)
y1 <- runif(26)
y2 <- pmax(0, y1 - runif(26, 0, .1))
dotchart2(y1, g, groups=maj, auxdata=n, auxtitle='n', xlab='Y')
dotchart2(y2, g, groups=maj, pch=17, add=TRUE)
## Compare with dotchart function (no superpositioning or auxdata allowed):
## dotchart(y1, g, groups=maj, xlab='Y')

## To plot using a transformed scale add for example
## axisat=sqrt(pretty(y)), axislabels=pretty(y)



