library(googleVis)


### Name: Fruits
### Title: Fruits: googleVis example data set
### Aliases: Fruits
### Keywords: datasets

### ** Examples

data(Fruits)
M <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")

## Not run: 
##D  plot(M)
## End(Not run)



