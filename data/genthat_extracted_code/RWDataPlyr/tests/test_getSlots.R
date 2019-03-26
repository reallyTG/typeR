library(RWDataPlyr)
library(dplyr)

context("check that RWDataPlyr:::getSlots() works as intended")

# expected number of years and traces in the extdata
nYrs <- 5
nTraces <- 4

sal <- slot_agg_list(matrix(
  c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA,"pe",
    "KeySlots.rdf", "no.Pool Elevation", "EOCY", NA, "no"),
  nrow = 2,
  byrow = TRUE
))[[1]]
df <- RWDataPlyr:::getSlots(
  sal, 
  scenPath = system.file(
    "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most", 
    package = "RWDataPlyr"
  ),
  findAllSlots = FALSE
)

test_that("data is returned when one slot cannot be found", {
  expect_equal(dim(df), c(nTraces*nYrs + 1, 4))
  expect_equal(dim(filter(df, Variable == "no")), c(1,4))
  expect_equal(filter(df, Variable == "no")$Trace, -99)
  expect_equal(filter(df, Variable == "no")$Year, -99)
  expect_equal(filter(df, Variable == "no")$Value, -99)
})

test_that("still get an error when 2nd slot is the one that cannot be found", {
  expect_error(RWDataPlyr:::getSlots(
    sal, 
    scenPath = system.file(
      "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most", 
      package = "RWDataPlyr"
    ),
    findAllSlots = TRUE
  ),
  paste("slot:", "no.Pool Elevation", "not found in rdf:", "KeySlots.rdf"))
})

sal <- slot_agg_list(matrix(
  c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA,"pe",
    "KeySlots.rdf", "no.Pool Elevation", "EOCY", NA, "no",
    "KeySlots.rdf", "nonono.Pool Elevation", "EOCY", NA, "no2"),
  nrow = 3,
  byrow = TRUE
))[[1]]
df <- RWDataPlyr:::getSlots(
  sal, 
  scenPath = system.file(
    "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most", 
    package = "RWDataPlyr"
  ),
  findAllSlots = FALSE
)

test_that("getSlots works with multiple unfound slots", {
  expect_equal(dim(df), c(nTraces*nYrs + 2, 4))
  expect_equal(dim(filter(df, Year == -99)), c(2,4))
})
