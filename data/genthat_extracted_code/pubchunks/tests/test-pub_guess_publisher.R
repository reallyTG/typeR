context("pub_guess_publisher")

test_that("pub_guess_publisher works", {
  x <- system.file("examples/pensoft_1.xml", package = "pubchunks")
  aa <- pub_guess_publisher(x)
  
  x <- system.file("examples/copernicus_2.xml", package = "pubchunks")
  bb <- pub_guess_publisher(x)
  
  x <- system.file("examples/peerj_1.xml", package = "pubchunks")
  cc <- pub_guess_publisher(x)
  
  x <- system.file("examples/hindawi_1.xml", package = "pubchunks")
  dd <- pub_guess_publisher(x)
  
  x <- system.file("examples/frontiers_1.xml", package = "pubchunks")
  ee <- pub_guess_publisher(x)

  x <- system.file("examples/f1000research_1.xml", package = "pubchunks")
  ff <- pub_guess_publisher(x)

  expect_is(aa, "list")
  expect_named(aa, c('full_name', 'short_name'))
  expect_is(aa$full_name, "character")
  expect_is(aa$short_name, "character")
  expect_equal(aa$short_name, "pensoft")

  expect_is(bb, "list")
  expect_named(bb, c('full_name', 'short_name'))
  expect_is(bb$full_name, "character")
  expect_is(bb$short_name, "character")
  expect_equal(bb$short_name, "copernicus")

  expect_is(cc, "list")
  expect_named(cc, c('full_name', 'short_name'))
  expect_is(cc$full_name, "character")
  expect_is(cc$short_name, "character")
  expect_equal(cc$short_name, "peerj")

  expect_is(dd, "list")
  expect_named(dd, c('full_name', 'short_name'))
  expect_is(dd$full_name, "character")
  expect_is(dd$short_name, "character")
  expect_equal(dd$short_name, "hindawi")

  expect_is(ee, "list")
  expect_named(ee, c('full_name', 'short_name'))
  expect_is(ee$full_name, "character")
  expect_is(ee$short_name, "character")
  expect_equal(ee$short_name, "frontiers")

  expect_is(ff, "list")
  expect_named(ff, c('full_name', 'short_name'))
  expect_is(ff$full_name, "character")
  expect_is(ff$short_name, "character")
  expect_equal(ff$short_name, "f1000research")
})

test_that("pub_guess_publisher fails well", {
  expect_error(pub_guess_publisher(), "argument \"x\" is missing")
  expect_error(pub_guess_publisher(5), "x must be of class")
})
