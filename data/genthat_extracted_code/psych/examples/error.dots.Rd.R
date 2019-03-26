library(psych)


### Name: error.dots
### Title: Show a dot.chart with error bars for different groups or
###   variables
### Aliases: error.dots
### Keywords: multivariate hplot

### ** Examples

temp <- error.dots(bfi[1:25],sort=TRUE, xlab="Mean score for the item, sorted by difficulty")
error.dots(bfi[1:25],sort=TRUE, order=temp$order, add=TRUE, eyes=TRUE) #over plot with eyes

error.dots(ability,eyes=TRUE, xlab="Mean score for the item")




