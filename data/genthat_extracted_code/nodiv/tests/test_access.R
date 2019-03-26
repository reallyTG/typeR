context("distrib_data access")

data(coquettes)

test_that("occurrences", {
  expect_equal(sum(occurrences(coquettes, 12)), 1765)
  expect_equal(length(occurrences(coquettes, 12)), 28)
  expect_equal(length(occurrences(coquettes, c(12,21))), 2)
  expect_equal(class(occurrences(coquettes, c("Heliangelus_strophianus", "Discosura_popelairii"))), "list")
  expect_equal(as.numeric(sapply(occurrences(coquettes, c("Heliangelus_strophianus", "Discosura_popelairii")), length)), c(5,2))
  expect_named(occurrences(coquettes, c("Heliangelus_strophianus", "Discosura_popelairii")))
  expect_equal(class(occurrences(coquettes, c(13,19), "logical")), "matrix")
  expect_equal(sum(occurrences(coquettes, c(13,19), "logical")), 47)
  expect_equal(dim(occurrences(coquettes, c(13,19), "logical")), c(154, 2))  
  expect_equal(typeof(occurrences(coquettes, c(13,19), "logical")), "logical")
  expect_equal(head(occurrences(coquettes, c("Heliangelus_strophianus", "Discosura_popelairii"), "names")[[1]]), c("186", "239", "256", "335", "349"))
})

test_that("assemblage", {
  expect_equal(sum(assemblage(coquettes, 15)), 93)
  expect_equal(assemblage(coquettes, 110), c(4, 8, 10, 11, 13, 14, 15, 17))
})

test_that("clade attributes", {
  expect_equal(Node_size(coquettes, 34), 3)
  expect_equal(Node_size(coquettes, 39), 4)
  expect_s4_class(Node_sites(coquettes, 39), "SpatialPointsDataFrame")
  expect_lt(abs(Node_sites(coquettes, 39)@bbox[1,2] + 72.93797), 0.001)
  expect_length(Node_species(coquettes, 28), 15)
  expect_equal(Node_species(coquettes, 28)[3], "Aglaiocercus_kingi")
  expect_equivalent(Node_species(coquettes, 28, names = F), 1:15)
  expect_equal(Node_occupancy(coquettes)[5],  Node_occupancy(coquettes, 29))
  expect_equal(Node_occupancy(coquettes, 30:32), c(66, 105, 96))
})

