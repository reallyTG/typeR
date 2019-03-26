library(robustbase)


### Name: wagnerGrowth
### Title: Wagner's Hannover Employment Growth Data
### Aliases: wagnerGrowth
### Keywords: datasets

### ** Examples

data(wagnerGrowth)
## maybe
str(wagnerGrowth)


require(lattice)
(xyplot(y ~ Period | Region, data = wagnerGrowth,
         main = "wagnerGrowth: 21 regions @ Hannover"))

(dotplot(y ~ reorder(Region,y,median), data = wagnerGrowth,
         main = "wagnerGrowth",
         xlab = "Region [ordered by  median(y | Region) ]"))



