context("rg_position")

test_that("rg_position works", {
  expect_is(rg_position(), "list")
  expect_is(rg_position()[[1]], "numeric")
  expect_type(rg_position()[[1]], "double")
  expect_equal(length(rg_position()[[1]]), 2)

  # lng is between -180 and 180
  lngs <- replicate(10^4, abs(rg_position()[[1]][1]))
  expect_true(all(lngs <= 180))

  # lat is between -90 and 90
  lats <- replicate(10^4, abs(rg_position()[[1]][2]))
  expect_true(all(lats <= 90))

  # positions are within bounding box
  in_box <- rg_position(100, bbox = c(-10, 10, 30, 40))
  expect_true(all(sapply(in_box, function(x) x[1]) > -10))
  expect_true(all(sapply(in_box, function(x) x[1]) < 30))
  expect_true(all(sapply(in_box, function(x) x[2]) > 10))
  expect_true(all(sapply(in_box, function(x) x[2]) < 40))

  # count works
  expect_equal(length(rg_position(count = 10)), 10)
})

test_that("rg_position fails well", {
  expect_error(rg_position(count = "Asdfasfd"), "count must be of class")
  expect_error(rg_position(count = mtcars), "count must be of class")
  expect_error(rg_position(stuff = 5), "unused argument")
  expect_error(rg_position(bbox = mtcars), "bbox must be of class")
  expect_error(rg_position(bbox = 4), "length\\(bbox\\) == 4 is not TRUE")
})
