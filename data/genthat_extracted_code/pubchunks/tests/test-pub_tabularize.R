context("pub_tabularize")

test_that("pub_tabularize works", {
  skip_on_cran()

  x <- system.file("examples/elife_1.xml", package = "pubchunks")
  res <- pub_chunks(x, c("doi", "title", "keywords"))
  aa <- pub_tabularize(res)

  ## example 2, a file path
  y <- system.file("examples/frontiers_1.xml", package = "pubchunks")
  res2 <- pub_chunks(y, c("doi", "title", "keywords"))
  bb <- pub_tabularize(res2)

  # > 1, a list of file paths
  res <- pub_chunks(list(x, y), c("doi", "title", "keywords"))
  cc <- pub_tabularize(res)

  # with fulltext package
  dois <- c('10.1371/journal.pone.0086169', '10.1371/journal.pone.0155491')
  x <- fulltext::ft_get(dois, from='plos')
  tmp <- pub_chunks(fulltext::ft_collect(x), sections=c("doi","title"))
  dd <- pub_tabularize(tmp)

  
  expect_is(aa, "data.frame")
  expect_is(bb, "data.frame")
  expect_is(cc, "list")
  expect_is(cc[[1]], "data.frame")
  expect_is(cc[[2]], "data.frame")
  expect_is(dd, "list")
  expect_is(dd[[1]], "list")
  expect_is(dd[[1]][[1]], "data.frame")

  expect_equal(NROW(aa), 6)
  expect_equal(NROW(bb), 6)
  expect_equal(NROW(cc[[1]]), 6)
  expect_equal(NROW(cc[[2]]), 6)
  expect_equal(NROW(dd[[1]][[1]]), 1)
  
  expect_named(aa, c("doi", "title", "keywords", ".publisher"))
  expect_named(bb, c("doi", "title", "keywords", ".publisher"))
  expect_named(cc[[1]], c("doi", "title", "keywords", ".publisher"))
  expect_named(dd, "plos")
  expect_named(dd[[1]][[1]], c("doi", "title", ".publisher"))
})

test_that("pub_tabularize fails well", {
  skip_on_cran()

  expect_error(pub_tabularize(), "\"x\" is missing")
  expect_error(pub_tabularize('adfafsdf'), "no pub_tabularize method for character")
  expect_error(pub_tabularize(5), "no pub_tabularize method for numeric")
})
