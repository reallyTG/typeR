context("filest function")

test_that("filest function",{

  res <- demo.filest()

  expect_type(res, "character")
  expect_equal(file.exists(file.path(res,"example1.txt")), TRUE)
  expect_equal(dir.exists(file.path(res,"example1")), TRUE)
  expect_equal(file.exists(file.path(res,"example1","simSNP_rep1.bed")), TRUE)

  unlink(file.path(res,"example1"), recursive = TRUE)
  file.remove(file.path(res,"example1.txt"))

})
