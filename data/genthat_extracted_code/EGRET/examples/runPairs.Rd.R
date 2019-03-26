library(EGRET)


### Name: runPairs
### Title: Runs a comparison of any two years in the record.
### Aliases: runPairs

### ** Examples

eList <- Choptank_eList
year1 <- 1985
year2 <- 2010

## Not run: 
##D # Automatic calculations based on windowSide=7
##D # four possible ways to do generalized flow normalization:
##D 
##D #Option 1: Use all years for flow normalization.
##D 
##D pairOut_1 <- runPairs(eList, year1, year2, windowSide = 0)
##D 
##D # Option 2:  Use different windows for flow normalization for year1 versus year2
##D #            In each case it is a 15 year window (15 = 1 + 2*7)
##D 
##D pairOut_2 <- runPairs(eList, year1, year2, windowSide = 7)
##D 
##D # Option 3: Flow normalization is based on splitting the flow record at 1990-09-30
##D #          But year1 uses all flow data from before the break, 
##D #          year2 uses all flow data after the break
##D 
##D pairOut_3 <- runPairs(eList, year1, year2, 
##D                       windowSide = 0, flowBreak = TRUE,
##D                       Q1EndDate = "1990-09-30")
##D 
##D # Option 4: Flow normalization is based on splitting the flow record at 1990-09-30
##D #           but year1 uses a 15 year window before the break
##D #           year2 uses a 15 year window after the break
##D 
##D pairOut_4 <- runPairs(eList, year1, year2, 
##D                       windowSide = 7, flowBreak = TRUE,
##D                       Q1EndDate = "1990-09-30")
##D                       
##D 
## End(Not run)



