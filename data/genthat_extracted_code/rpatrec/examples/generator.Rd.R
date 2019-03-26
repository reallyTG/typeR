library(rpatrec)


### Name: generator
### Title: Generate a time series containing a Visual Charting Pattern.
### Aliases: generator

### ** Examples

## Not run: 
##D #create a standard HS pattern:
##D generator()
##D #
##D 
##D #create a shifted head and shoulders pattern
##D generator(sprd = c(20,10,90,40,60))
##D #
##D #create a Double Tops pattern
##D generator(plength=3,parts=c(25,50,75),sprd=c(80,40,80))
##D #
##D #create a Rectangle Tops pattern
##D generator(plength=5,parts=c(20,40,50,60,80),sprd=c(80,40,80,40,80))
##D #
##D #create a single peak, 10 data points, max is approximately 10
##D generator(0,10,10,0,0,0,50,100)
## End(Not run)




