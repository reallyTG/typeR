library(EGRETci)


### Name: runGroupsBoot
### Title: The bootstrap uncertainty analysis for runGroups results
### Aliases: runGroupsBoot

### ** Examples

library(EGRET)
eList <- Choptank_eList

## Not run: 
##D groupResults <- runGroups(eList, 
##D                           group1firstYear = 1995, 
##D                           group1lastYear = 2004, 
##D                           group2firstYear = 2005, 
##D                           group2lastYear = 2014, 
##D                           windowSide = 7, wall = TRUE, 
##D                           sample1EndDate = "2004-10-30", 
##D                           paStart = 4, paLong = 2, 
##D                           verbose = FALSE)
##D 
##D boot_group_out <- runGroupsBoot(eList, groupResults)
##D 
##D plotHistogramTrend(eList, boot_group_out, caseSetUp=NA)
## End(Not run)



