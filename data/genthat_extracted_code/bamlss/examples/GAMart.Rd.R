library(bamlss)


### Name: GAMart
### Title: GAM Artificial Data Set
### Aliases: GAMart
### Keywords: datasets

### ** Examples

d <- GAMart()
head(d)

## Not run: 
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3) + te(lon,lat), data = d)
##D plot(b)
## End(Not run)



