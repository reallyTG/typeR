context("proper")

test_that("Proper words", {
  my.str <- "a"
  expect_equal(proper(my.str), "A")

  my.str <- "wORD"
  expect_equal(proper(my.str), "Word")

  my.str <- "Dummy"
  expect_equal(proper(my.str), "Dummy")

  my.str <- "sUcH"
  expect_equal(proper(my.str), "Such")

  my.str <- "ExPeCTeD"
  expect_equal(proper(my.str), "Expected")
})

test_that("Proper a phrase", {
  my.str <- "OnE oF sUcH iS a proPer function that capitalizes a string."
  expect_equal(proper(my.str), "One Of Such Is A Proper Function That Capitalizes A String.")
})
