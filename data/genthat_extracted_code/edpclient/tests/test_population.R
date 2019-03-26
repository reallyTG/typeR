test_that("populations can be listed", {
  skip_on_cran()
  pops <- populations(SESS)
  p <- pops[pops$id == GSS3_PID, ]
  expect_equal(nrow(p), 1)
  expect_equal(p$name, "gss3")
  expect_gte(p$nmodels, 3)
})

test_that("population object utilities work", {
  skip_on_cran()
  p <- population(SESS, GSS3_PID)
  expect_true(is.population(p))
  expect_false(is.population("not a population"))
  expect_equal(as.character(p), GSS3_PID)
  expect_equal(p$name, "gss3")
  expect_length(names(p), 48)
  expect_true("babies" %in% names(p))
  print(p)
})

test_that("population model object utilities work", {
  skip_on_cran()
  pm <- popmod(SESS, GSS3_PMID)
  expect_true(is.popmod(pm))
  expect_false(is.popmod("not a population model"))
  expect_equal(as.character(pm), GSS3_PMID)
  expect_equal(pm$name, "gss3m")
  expect_equal(pm$id, GSS3_PMID)
  expect_equal(pm$parent_id, GSS3_PID)
  expect_equal(pm$build_status, "built")
  print(pm)
})

test_that("population models on a population can be listed", {
  skip_on_cran()
  pms <- popmods(population(SESS, GSS3_PID))
  expect_gte(nrow(pms), 3)
  expect_true(all(pms$parent_id == GSS3_PID))
  expect_true(all(startsWith(pms$id, "pm-")))
})

test_that("we can find the latest population model", {
  skip_on_cran()
  pm <- latest_popmod(population(SESS, GSS3_PID))
  expect_true(is.popmod(pm))
  expect_equal(pm$id, GSS3_PMID)
})
