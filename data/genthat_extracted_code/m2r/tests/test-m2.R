context("m2 ")

test_that("m2 works properly", {
  skip_on_cran()

  expect_equal(m2("1 + 1"), "2")
})

test_that("mutable lists parse to NULL", {
  skip_on_cran()

  expect_equal(m2("new MutableList from {1,2,3}"), NULL)
})

test_that("basic m2 computations work", {
  skip_on_cran()

  expect_equal(m2("1 + 1"), "2")
})



context("m2.")

test_that("m2. works properly", {
  skip_on_cran()

  out <- m2.("1 + 1")
  expect_equal(m2_meta(out), list(ext_str = "2", m2_class = "ZZ", m2_class_class = "Ring"))
  expect_equal(str_detect(m2_name(out), "m2o[0-9]+"), TRUE)
  expect_equal(class(out), c("m2_pointer", "m2"))
})

