library(spatstat.data)


### Name: residualspaper
### Title: Data and Code From JRSS Discussion Paper on Residuals
### Aliases: residualspaper
### Keywords: datasets spatial models

### ** Examples


## Not run: 
##D   data(residualspaper)
##D   
##D   if(require(spatstat)) {
##D 
##D   X <- residualspaper$Fig4a
##D   summary(X)
##D   plot(X)
##D 
##D   # reproduce all Figures
##D   residualspaper$plotfig()
##D 
##D   # reproduce Figures 1 to 10
##D   residualspaper$plotfig(1:10)
##D 
##D   # reproduce Figure 7 (a)
##D   residualspaper$plotfig("7a")
##D   }
## End(Not run)



