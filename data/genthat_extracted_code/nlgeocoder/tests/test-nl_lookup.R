context("nl_lookup")

test_that("id = weg-998023d41c562b2b433378161ea5670", {
  skip_on_cran()
  res <- nl_lookup(id = "weg-998023d41c562b2b433378161ea56704")
  expect_true(res$id == "weg-998023d41c562b2b433378161ea56704")
})

test_that("Filter attributes - weergavenaam and type", {
  skip_on_cran()
  res <- nl_lookup(id = "weg-998023d41c562b2b433378161ea56704", fl = "weergavenaam, type")
  n <- names(res)
  expect_equal(names(res), c("type", "weergavenaam"))
})
