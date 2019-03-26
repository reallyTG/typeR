library(diveMove)


### Name: plotZOC-methods
### Title: Methods for visually assessing results of ZOC procedure
### Aliases: plotZOC-methods plotZOC plotZOC,TDR,matrix-method
###   plotZOC,TDR,TDRcalibrate-method
### Keywords: methods iplot

### ** Examples


## Using the Example from '?diveStats':

## No test: 
## Too long for checks
utils::example("diveStats", package="diveMove",
               ask=FALSE, echo=FALSE)

## Plot filters for ZOC
## Work on first phase (trip) subset, to save processing time, since
## there's no drift nor shifts between trips
tdr <- divesTDR[1:15000]
## Try window widths (K), quantiles (P) and bound the search (db)
K <- c(3, 360); P <- c(0.5, 0.02); db <- c(0, 5)
d.filter <- diveMove:::.depthFilter(depth=getDepth(tdr),
                                    k=K, probs=P, depth.bounds=db,
                                    na.rm=TRUE)
old.par <- par(no.readonly=TRUE)
plotZOC(tdr, d.filter, ylim=c(0, 6))
par(old.par)

## Plot corrected and uncorrected depth, regardless of method
## Look at three different scales
xlim1 <- c(getTime(divesTDR)[7100], getTime(divesTDR)[11700])
xlim2 <- c(getTime(divesTDR)[7100], getTime(divesTDR)[7400])
xlim3 <- c(getTime(divesTDR)[7100], getTime(divesTDR)[7200])
par(mar=c(3, 4, 0, 1) + 0.1, cex=1.1, las=1)
layout(seq(3))
plotZOC(divesTDR, dcalib, xlim=xlim1, ylim=c(0, 6))
plotZOC(divesTDR, dcalib, xlim=xlim2, ylim=c(0, 70))
plotZOC(divesTDR, dcalib, xlim=xlim3, ylim=c(0, 70))
par(old.par)

## End(No test)




