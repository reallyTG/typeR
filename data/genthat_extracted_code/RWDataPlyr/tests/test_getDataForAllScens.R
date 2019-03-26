library(RWDataPlyr)
context('check that getDataForAllScens works')

# get a specified set of slots and apply some aggregation method to them
scenNames <- scenFolders <- c('ISM1988_2014,2007Dems,IG,Most') 

slotAggList <- slot_agg_list(system.file(
  'extdata/SlotAggTable.csv',
  package = 'RWDataPlyr'
))
scenPath <- system.file('extdata','Scenario/',package = 'RWDataPlyr')

oPath <- file.path(tempdir(), "get_data_test")
dir.create(oPath)
teardown(unlink(oPath, recursive = TRUE))
oFile <- file.path(oPath, "tmp.txt")

expect_warning(keyData <- getDataForAllScens(
  scenFolders, 
  scenNames, 
  slotAggList, 
  scenPath, 
  file.path(oPath, "tmp2.txt")
))


slotAggList <- list(list(rdf = 'KeySlots.rdf', slots = 'all'))
# will return monthly data for all slots in KeySlots.rdf
expect_warning(allData <- getDataForAllScens(
  scenFolders, 
  scenNames, 
  slotAggList, 
  scenPath, 
  oFile
))

expectedSlotNames <- sort(paste(rdf_slot_names(keyRdf),'Monthly','1',sep='_'))

test_that("getting all slot data from RDF does actually return all slots", {
  expect_equal(levels(as.factor(allData$Variable)),expectedSlotNames)
})

test_that("getting all slot data matches a pre-configured slotAggList", {
  expect_equal(
    dplyr::filter(keyData, Variable == 'Powell.Outflow_EOCY_0.001')$Value,
    (dplyr::filter(
      allData, 
      Variable == 'Powell.Outflow_Monthly_1', 
      Month == 'December'
    )$Value) * 0.001
  )
  
  expect_equal(
    dplyr::filter(keyData, Variable == 'Mead.Pool Elevation_EOCY_1')$Value,
    dplyr::filter(
      allData, 
      Variable == 'Mead.Pool Elevation_Monthly_1', 
      Month == 'December'
    )$Value
  )
})

test_that('file extension is checked', {
  expect_error(
    expect_warning(
      getDataForAllScens(
        scenFolders, 
        scenNames, 
        slotAggList, 
        scenPath, 
        'tst.xyz'
      )
    ),
    paste0(
      'oFile has an invalid file exention.\n',
      'getDataForAllScens does not know how to handle ".', 'xyz',
      '" extensions.'
    )
  )
  
  expect_error(
    expect_warning(
      getDataForAllScens(
        scenFolders, 
        scenNames, 
        slotAggList, 
        scenPath, 
        'tst.cvs'
      )
    ),
    paste0(
      'oFile has an invalid file exention.\n',
      'getDataForAllScens does not know how to handle ".', 'cvs',
      '" extensions.'
    )
  )
})

# a .txt already exists, create .csv and .feather
# monthly
expect_warning(getDataForAllScens(
  scenFolders, 
  scenNames, 
  slotAggList, 
  scenPath, 
  file.path(oPath, "tmp.feather")
))

expect_warning(getDataForAllScens(
  scenFolders, 
  scenNames, 
  slotAggList, 
  scenPath, 
  oFile = file.path(oPath, "tmp.csv")
))

# annual (keyData)
slotAggList <- slot_agg_list(system.file(
  'extdata/SlotAggTable.csv',
  package = 'RWDataPlyr'
))
expect_warning(getDataForAllScens(
  scenFolders, 
  scenNames, 
  slotAggList, 
  scenPath, 
  oFile = file.path(oPath, "tmp2.feather")
))

expect_warning(getDataForAllScens(
  scenFolders, 
  scenNames, 
  slotAggList, 
  scenPath, 
  oFile = file.path(oPath, "tmp2.csv")
))

test_that("data matches regardless of file extension", {
  expect_equal(
    keyData, 
    data.table::fread(file.path(oPath, "tmp2.txt"), data.table = FALSE)
  )
  expect_equal(
    allData, 
    data.table::fread(file.path(oPath, "tmp.txt"), data.table = FALSE)
  )
  expect_equal(
    keyData, 
    data.table::fread(file.path(oPath, "tmp2.csv"), data.table = FALSE)
  )
  expect_equal(
    allData, 
    data.table::fread(file.path(oPath, "tmp.csv"), data.table = FALSE)
  )
  expect_equal(
    keyData, 
    as.data.frame(feather::read_feather(file.path(oPath, "tmp2.feather")))
  )
  expect_equal(
    allData, 
    as.data.frame(feather::read_feather(file.path(oPath, "tmp.feather")))
  )
})

