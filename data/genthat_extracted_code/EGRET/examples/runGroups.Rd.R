library(EGRET)


### Name: runGroups
### Title: Runs a comparison of any group of years in the record.
### Aliases: runGroups

### ** Examples

eList <- Choptank_eList
## Not run: 
##D 
##D #Option 1:  Use all years for group flow normalization.
##D groupOut_1 <- runGroups(eList,  windowSide = 0,
##D                        group1firstYear = 1980, group1lastYear = 1990,
##D                        group2firstYear = 1995, group2lastYear = 2005)
##D 
##D # Option 2: Use sliding window.
##D #                In each case it is a 15 year window (15 = 1 + 2*7)
##D 
##D groupOut_2 <- runGroups(eList,  windowSide = 7,
##D                        group1firstYear = 1980, group1lastYear = 1990,
##D                        group2firstYear = 1995, group2lastYear = 2005)
##D 
##D # Option 3: Flow normalization is based on splitting the flow record at 1990-09-30
##D #                But in years before the break it uses all flow data from before the break,
##D #                and years after the break uses all flow data after the break
##D 
##D groupOut_3 <- runGroups(eList,  windowSide = 0,
##D                        group1firstYear = 1980, group1lastYear = 1990,
##D                        group2firstYear = 1995, group2lastYear = 2005,
##D                        flowBreak = TRUE, 
##D                        Q1EndDate = "1990-09-30")
##D 
##D # Option 4: Flow normalization is based on splitting the flow record at 1990-09-30
##D #                but before the break uses a 15 year window of years before the break
##D #                after the break uses a 15 year window of years after the break
##D groupOut_4 <- runGroups(eList,  windowSide = 7,
##D                        group1firstYear = 1980, group1lastYear = 1990,
##D                        group2firstYear = 1995, group2lastYear = 2005,
##D                        flowBreak = TRUE, 
##D                        Q1EndDate = "1990-09-30")
##D 
## End(Not run)



