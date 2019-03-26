library(STAR)


### Name: purkinjeCellData
### Title: Spike Trains of a Purkinje Cells (PC) Recorded in Control
###   Conditions and With Bath Applied Bicuculline
### Aliases: sPK mPK
### Keywords: datasets

### ** Examples

## Not run: 
##D ## load spontaneous data of 1 Purkinje cell
##D ## recorded in cell attached mode from a cerebellar
##D ## slice in control and bath applied bicuculline conditions
##D data(sPK)
##D ## coerce data to spikeTrain objects
##D sPK <- lapply(sPK,as.spikeTrain)
##D ## Get a summary of the ctl data
##D summary(sPK[["ctl"]])
##D ## Look at the control train
##D ## Don't show the rug plot for clarity
##D plot(sPK[["ctl"]],addRug=FALSE)
##D ## Generate the renewal test plot taking into account
##D ## the size of the data set (a lot of spikes!).
##D renewalTestPlot(sPK[["ctl"]],d=10,orderPlotPch=".",lag.max=250)
##D ## Get a summary of the bicu data
##D summary(sPK[["bicu"]])
##D ## Look at the control train
##D ## Don't show the rug plot for clarity
##D plot(sPK[["bicu"]],addRug=FALSE)
##D ## Generate the renewal test plot taking into account
##D ## the size of the data set (a lot of spikes!).
##D renewalTestPlot(sPK[["bicu"]],d=10,orderPlotPch=".",lag.max=250);par(oldpar)
##D ## This time the data are NOT stationary. This is seen clearly on a acf
##D ## plot with very large lag.max
##D acf.spikeTrain(sPK[["bicu"]],lag.max=2000)
##D 
## End(Not run)



