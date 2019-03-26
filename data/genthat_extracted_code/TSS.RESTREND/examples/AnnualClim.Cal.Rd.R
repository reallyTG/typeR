library(TSS.RESTREND)


### Name: AnnualClim.Cal
### Title: Antecedental accumulation calculator for the annual max VI time
###   series
### Aliases: AnnualClim.Cal

### ** Examples

ARC <- AnnualClim.Cal(stdRESTREND$max.NDVI, stdRESTREND$index, stdRESTRENDrfTab)
print(ARC)
## Not run: 
##D 
##D #Test the complete time series for breakpoints
##D VPRBFdem <- VPR.BFAST(segVPRCTSR$cts.NDVI, segVPRCTSR$cts.precip)
##D bp<-as.numeric(VPRBFdem$bkps)
##D 
##D #test the significance of the breakpoints
##D reschow <- CHOW(segVPR$max.NDVI, segVPR$acum.RF, segVPR$index, bp)
##D brkp <- as.integer(reschow$bp.summary["yr.index"])
##D ARCseg <-AnnualClim.Cal(segVPR$max.NDVI, segVPR$index, segVPRrfTab, Breakpoint = brkp)
##D print(ARCseg)
## End(Not run)



