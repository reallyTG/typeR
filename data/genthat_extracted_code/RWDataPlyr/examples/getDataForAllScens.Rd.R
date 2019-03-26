library(RWDataPlyr)


### Name: getDataForAllScens
### Title: Get and aggregate data from an rdf file(s)
### Aliases: getDataForAllScens

### ** Examples

# get a specified set of slots and apply some aggregation method to them
# get the data from two scenarios
scenFolders <- c('ISM1988_2014,2007Dems,IG,Most', 
  'ISM1988_2014,2007Dems,IG,2002') 
# slotAggTable.csv lists the slots to obtain, and the aggregation method to 
# apply to them
slotAggList <- slot_agg_list(
  system.file('extdata','SlotAggTable.csv',package = 'RWDataPlyr')
)
scenPath <- system.file('extdata','Scenario/',package = 'RWDataPlyr')
# expect Deprecated warning
testthat::expect_warning(
  keyData <- getDataForAllScens(
    scenFolders, 
    scenNames = scenFolders, 
    slotAggList = slotAggList, 
    scenPath = scenPath
  )
)

# get all of the data from the KeySlots rdf file
scenFolders <- scenFolders[1] # only one scenario
slotAggList <- list(list(rdf = 'KeySlots.rdf', slots = 'all'))
# will return monthly data for all slots in KeySlots.rdf
# expect Deprecated warning
testthat::expect_warning(
  allData <- getDataForAllScens(
    scenFolders, 
    scenNames = scenFolders, 
    slotAggList = slotAggList, 
    scenPath = scenPath
  )
)




