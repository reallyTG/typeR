library(openair)


### Name: corPlot
### Title: corrgram plot with conditioning
### Aliases: corPlot
### Keywords: methods

### ** Examples


# load openair data if not loaded already
data(mydata)
## basic corrgram plot
corPlot(mydata)
## plot by season ... and so on
corPlot(mydata, type = "season")
## recover dendogram when cluster = TRUE and plot it
res <-corPlot(mydata)
plot(res$clust)
## Not run: 
##D ## a more interesting are hydrocarbon measurements
##D hc <- importAURN(site = "my1", year = 2005, hc = TRUE)
##D ## now it is possible to see the hydrocarbons that behave most
##D ## similarly to one another
##D corPlot(hc)
## End(Not run)





