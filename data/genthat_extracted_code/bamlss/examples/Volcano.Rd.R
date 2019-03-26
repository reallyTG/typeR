library(bamlss)


### Name: Volcano
### Title: Artificial Data Set based on Auckland's Maunga Whau Volcano
### Aliases: Volcano
### Keywords: datasets

### ** Examples

d <- Volcano()
head(d)

## Not run: 
##D b <- bamlss(y ~ te(lon,lat,k=10), data = d)
##D plot(b, theta = -130)
## End(Not run)



