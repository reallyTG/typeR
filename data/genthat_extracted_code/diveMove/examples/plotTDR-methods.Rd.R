library(diveMove)


### Name: plotTDR-methods
### Title: Methods for plotting objects of class "TDR" and "TDRcalibrate"
### Aliases: plotTDR-methods plotTDR plotTDR,POSIXt,numeric-method
###   plotTDR,TDR,missing-method plotTDR,TDRcalibrate,missing-method
### Keywords: methods iplot

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
## Use interact=TRUE (default) to set an offset interactively
## Plot the 'TDR' object
plotTDR(getTime(divesTDR), getDepth(divesTDR), interact=FALSE)
plotTDR(divesTDR, interact=FALSE)

## Plot different aspects of the 'TDRcalibrate' object
plotTDR(dcalib, interact=FALSE)
plotTDR(dcalib, diveNo=19:25, interact=FALSE)
plotTDR(dcalib, what="dive.model", diveNo=25)
if (dev.interactive(orNone=TRUE)) {
    ## Add surface observations and interact
    plotTDR(dcalib, surface=TRUE)
    ## Plot one dive
    plotTDR(dcalib, diveNo=200)
}

## End(No test)




