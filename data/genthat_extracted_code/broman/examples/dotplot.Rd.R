library(broman)


### Name: dotplot
### Title: Dot chart with a gray background
### Aliases: dotplot
### Keywords: graphics

### ** Examples

## Don't show: 
set.seed(97536917)
## End(Don't show)
x <- rnorm(40, c(1,3))
g <- rep(c("A", "B"), 20)
dotplot(g, x)
dotplot(g, x, "random")
dotplot(g, x, runif(length(g), -0.25, 0.25))




