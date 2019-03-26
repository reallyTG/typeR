library(ddalpha)


### Name: plot.ddalphaf
### Title: Plots for the "ddalphaf" Class
### Aliases: plot.ddalphaf
### Keywords: functional visualization

### ** Examples


## Not run: 
##D 
##D dataf = dataf.growth()
##D ddalphaf = ddalphaf.train (dataf$dataf, dataf$labels, 
##D                             classifier.type = "ddalpha", maxNumIntervals = 2)
##D 
##D # plot the functional data
##D plot(ddalphaf)
##D 
##D # plot depth contours and separation in the transformed space 
##D # (possible only if maxNumIntervals = 2)
##D plot(ddalphaf, type = "depth.contours")
##D 
##D # plot the DD-plot
##D plot(ddalphaf, type = "ddplot")
##D 
## End(Not run)



