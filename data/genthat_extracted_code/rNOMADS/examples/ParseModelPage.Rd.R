library(rNOMADS)


### Name: ParseModelPage
### Title: Extract predictions, levels, and variables
### Aliases: ParseModelPage
### Keywords: utilities

### ** Examples


#An example for the Global Forecast System 0.5 degree model

#Get the latest model url
## Not run: 
##D urls.out <- CrawlModels(abbrev = "gfs_0p50", depth = 1)
##D 
##D #Get a list of forecasts, variables and levels
##D model.parameters <- ParseModelPage(urls.out[1])
##D 
## End(Not run)





