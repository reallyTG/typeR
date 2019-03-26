test_that("add shape to object", {
  sh <- coquettes$shape
  coquettes$shape <- NULL
  expect(is.null(coquettes$shape))
  coquettes <- add_shape(coquettes, sh)
  expect_s4_class(coquettes$shape, "RasterLayer")
})

test_that("sitestat", {
  tst <- add_sitestat(coquettes, data.frame(sites = sites(coquettes),test = 1:154))
  expect_equal(sitestat(tst)[2], "test")
  test <- 154:1
  tst <- add_sitestat(coquettes, test)
  expect_equivalent(sitestat(tst, "test")[4], 151)
  # TODO: fix the case where only a single-column data frame is added
  # tst <- add_sitestat(coquettes, data.frame(test2 = test)) 
  # expect_equivalent(sitestat(tst, "test2")[4], 151)
  a = sample(1:154, 20)
  testdat <- data.frame(test3 = 1:20, sites = sites(tst)[a])
  tst <- add_sitestat(coquettes, testdat) # TODO: test output - it currently says "all sites matched, but that is an error
  expect_equal(sum(is.na(sitestat(tst, "test3"))), 134)
  expect_equivalent(sitestat(tst, "test3", a[3]), 3)
})

test_that("species_stat", {
  tst <- add_species_stat(coquettes, data.frame(species = species(coquettes),test = 1:24))
  expect_equal(species_stat(tst)[2], "test")
  test <- 24:1
  # TODO: this should work, given that it does for sites
  # tst <- add_species_stat(coquettes, test)
  # expect_equivalent(species_stat(tst, "test")[4], 21)
  
  # TODO: fix the case where only a single-column data frame is added
  # tst <- add_species_stat(coquettes, data.frame(test2 = test)) 
  # expect_equivalent(species_stat(tst, "test2")[4], 21)
  a = sample(1:24, 20)
  testdat <- data.frame(test3 = 1:20, species = species(tst)[a])
  tst <- add_species_stat(coquettes, testdat) 
  expect_equal(sum(is.na(species_stat(tst, "test3"))), 4)
  expect_equal(names(species_stat(tst, "test3", a[3])), species(tst)[a][3])
})