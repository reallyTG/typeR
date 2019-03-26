library(broman)


### Name: grayplot
### Title: Scatterplot with a gray background
### Aliases: grayplot
### Keywords: graphics

### ** Examples

## Don't show: 
set.seed(97536917)
## End(Don't show)
x <- rnorm(100)
y <- x+rnorm(100, 0, 0.7)
grayplot(x, y, col="slateblue", pch=16)
at <- seq(-3, 3)
grayplot(x, y, col="violetred", pch=16, hlines=at, vlines=at)
grayplot(x, col="Orchid", pch=16, bgcolor="gray80",
         hlines=seq(-4, 4, by=0.5), hlines.lwd=c(3,1),
         vlines=seq(0, 100, by=5), vlines.lwd=c(3,1,1,1))




