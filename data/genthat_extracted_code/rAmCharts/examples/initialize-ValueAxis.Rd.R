library(rAmCharts)


### Name: initialize,ValueAxis-method
### Title: Initializes ValueAxis
### Aliases: initialize,ValueAxis-method valueAxis
###   setTitle,ValueAxis,character-method

### ** Examples


guides <- list(guide(fillAlpha = .4), guide(fillAlpha = .5))
new("ValueAxis", title = "Hello !",  gridThickness = 1, guides = guides)

## Not run: 
##D new("ValueAxis", title = "Hello !", 1) # 1 is not take into account
##D 
##D # If one element of guides is not a Guide object, it shows an error
##D guides <- list(guide(fillAlpha = .4), b = 1)
##D new("ValueAxis", title = "Hello !",  gridThickness = 1, guides = guides)
## End(Not run)

valueAxis(title = "Hello !", axisTitleOffset = 12)

setTitle(.Object = valueAxis(), title = "Hello !")




