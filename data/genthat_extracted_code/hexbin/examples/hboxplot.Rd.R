library(hexbin)


### Name: hboxplot
### Title: 2-D Generalization of Boxplot
### Aliases: hboxplot
### Keywords: hplot

### ** Examples

## Don't show: 
set.seed(753)
## End(Don't show)
##  boxplot of smoothed counts
x <- rnorm(10000)
y <- rnorm(10000)

bin <- hexbin(x,y)
erodebin <- erode(smooth.hexbin(bin))

hboxplot(erodebin)
hboxplot(erodebin, density = c(32,7), border = c(2,4))
hp <- hboxplot(erodebin, density = c(-1,17),
               main = "hboxplot(erode*(smooth*(.)))")
pushHexport(hp)
library("grid")
grid.points(x[1:10], y[1:10])# just non-sense to show the principle
popViewport()



