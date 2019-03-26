library(RWDataPlyr)
context('check read.rdf')

r1 <- read.rdf(system.file(
  'extdata',
  file.path('Scenario','ISM1988_2014,2007Dems,IG,Most','KeySlots.rdf'),
  package = 'RWDataPlyr'
))
r2 <- read.rdf(system.file(
  'extdata',
  file.path('Scenario','ISM1988_2014,2007Dems,IG,Most','SystemConditions.rdf'),
  package = 'RWDataPlyr'
))
# current read vs. old read -------------------
test_that('read.rdf data are as expected', {
  expect_equal(r1, keyRdf)
  expect_equal(r2, sysRdf)
  
  expect_equal(rdf_get_slot(r1, 'Powell.Outflow'),
               rdf_get_slot(keyRdf, 'Powell.Outflow'))
  expect_equal(rdf_get_slot(r1, 'Mead.Pool Elevation'),
               rdf_get_slot(keyRdf, 'Mead.Pool Elevation'))
  expect_equal(
    rdf_get_slot(r2, "SummaryOutputData.LBShortageConditions"),
    rdf_get_slot(sysRdf, "SummaryOutputData.LBShortageConditions")
  )
  expect_equal(
    rdf_get_slot(r2, "SummaryOutputData.MidElevationReleaseAt748"),
    rdf_get_slot(sysRdf, "SummaryOutputData.MidElevationReleaseAt748")
  )
})

# slots exist ------------------
exptSlots <- c('Mead.Pool Elevation', 'Powell.Outflow') 

test_that('slots in rdf are those that are expected', {
  expect_equal(length(rdf_slot_names(keyRdf)),length(exptSlots))
  expect_equal(
    sum(rdf_slot_names(keyRdf) %in% exptSlots), 
    length(rdf_slot_names(keyRdf))
  )
})

# warnings ----------------------
test_that("read.rdf2 warnings post, and values match read.rdf", {
  expect_warning(
    r3 <- read.rdf2(
      system.file(
        'extdata',
        file.path('Scenario','ISM1988_2014,2007Dems,IG,Most','KeySlots.rdf'),
        package = 'RWDataPlyr'
      )
    ),
    paste(
      "'read.rdf2' is deprecated.", 
      "Use 'read.rdf' instead.", 'See help("Deprecated")', 
      sep = "\n"
    ),
    fixed = TRUE
  )
  expect_equal(r3, r1)
})

# scalar slots ------------------------
test_that("rdfs with scalar slots read in correctly", {
  expect_type(scl <- read.rdf("../rdfs/scalar.rdf"), "list")
  expect_type(srs <- read.rdf("../rdfs/series.rdf"), "list")
  expect_type(ss <- read.rdf("../rdfs/scalar_series.rdf"), "list")
  expect_setequal(
    rdf_slot_names(ss), 
    c(rdf_slot_names(scl), rdf_slot_names(srs))
  )
  
  for (slot in rdf_slot_names(scl)) {
    expect_identical(
      rdf_get_slot(scl, slot), 
      rdf_get_slot(ss, slot), 
      info = slot
    )
  }
  
  for (slot in rdf_slot_names(srs)) {
    expect_identical(
      rdf_get_slot(srs, slot), 
      rdf_get_slot(ss, slot), 
      info = slot
    )
  }
})

# check character vector ---------------
test_that("rdf = FALSE works", {
  expect_is(
    r1 <- read_rdf(system.file(
      'extdata',
      file.path('Scenario','ISM1988_2014,2007Dems,IG,Most','KeySlots.rdf'),
      package = 'RWDataPlyr'
    ), rdf = FALSE),
    "matrix"
  )
  expect_type(r1, "character")
  expect_equal(ncol(r1), 1)
  expect_true(nrow(r1) > 1)
})
