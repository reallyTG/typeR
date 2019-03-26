context('check rdf helper functions')

# the expected number of years and traces in the sample data in extdata/...
nYrs <- 5
nTraces <- 4

key <- read.rdf(system.file(
  "extdata/Scenario/T13,CT,IG/KeySlots.rdf", 
  package = "RWDataPlyr"
))
sys <- read.rdf(system.file(
  "extdata/Scenario/T13,CT,IG/SystemConditions.rdf", 
  package = "RWDataPlyr"
))

# rdf_get_slot -------------------------
test_that("rdf_get_slot gets correct dimensions for matrix", {
  expect_equal(
    dim(rdf_get_slot(keyRdf, 'Mead.Pool Elevation')),
    c(nYrs * 12, nTraces)
  )
  expect_equal(
    dim(rdf_get_slot(sysRdf, 'SummaryOutputData.LBShortageConditions')),
    c(nYrs, nTraces)
  )
  expect_equal(dim(rdf_get_slot(key, 'Mead.Pool Elevation')), c(240, 1))
  expect_equal(
    dim(rdf_get_slot(sys, 'SummaryOutputData.LBShortageConditions')),
    c(20, 1)
  )
})

test_that("`rdf_get_slot()` matches `rdfSlotToMatrix()`", {
  expect_identical(
    rdf_get_slot(keyRdf, 'Mead.Pool Elevation'),
    expect_warning(rdfSlotToMatrix(keyRdf, 'Mead.Pool Elevation'))
  )
  expect_identical(
    rdf_get_slot(sysRdf, 'SummaryOutputData.LBShortageConditions'),
    expect_warning(
      rdfSlotToMatrix(sysRdf, 'SummaryOutputData.LBShortageConditions')
    )
  )
})

# rdf_get_timespan -------------------
test_that('rdf_get_timespan returns expected dates', {
  # keyRdf includes monthly data so it starts in January. 
  # sysRdf includes annual data, so it starts in December.
  expect_equal(
    rdf_get_timespan(keyRdf), 
    c('start' = '2018-1-31 24:00', 'end' = '2022-12-31 24:00')
  )
  expect_equal(
    rdf_get_timespan(sysRdf), 
    c('start' = '2018-12-31 24:00', 'end' = '2022-12-31 24:00')
  )
})

test_that('rdf_get_timespan returns correct length', {
  expect_equal(length(rdf_get_timespan(keyRdf)),2)
})

test_that("rdf_get_timespan matches getTimeSpan", {
  expect_identical(
    rdf_get_timespan(keyRdf),
    expect_warning(getTimeSpan(keyRdf))
  )
  
  expect_identical(
    rdf_get_timespan(sysRdf),
    expect_warning(getTimeSpan(sysRdf))
  )
})

# rdf_slot_names() -----------------
test_that('rdf_slot_names returns expected slot names', {
  # use all and check if it's in the list. order does not matter.
  expect_equal(all(rdf_slot_names(keyRdf) %in% c('Mead.Pool Elevation',
                                                'Powell.Outflow')),TRUE)
  
  expect_equal(rdf_slot_names(keyRdf), expect_warning(getSlotsInRdf(keyRdf)))
  expect_equal(rdf_slot_names(sysRdf), expect_warning(getSlotsInRdf(sysRdf)))
})
