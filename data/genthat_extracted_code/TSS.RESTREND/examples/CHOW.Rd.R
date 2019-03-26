library(TSS.RESTREND)


### Name: CHOW
### Title: Chow test on detected breakpoints
### Aliases: CHOW

### ** Examples

## Not run: 
##D #Test the complete time series for breakpoints
##D VPRBFdem <- VPR.BFAST(segVPRCTSR$cts.NDVI, segVPRCTSR$cts.precip)
##D bp <- as.numeric(VPRBFdem$bkps)
##D #test the significance of the breakpoints
##D reschow <- CHOW(segVPR$max.NDVI, segVPR$acum.RF, segVPR$index, bp)
##D print(reschow)
## End(Not run)




