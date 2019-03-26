context("test check_input_tbl")

x <- tibble::tibble(a = 1:4, b = letters[1:4], c = c(0,
  0.25, 0.5, 0.75))
v2c <- c("a", "b", "c")
dt2c <- c("integer", "character", "numeric")
y <- check_input_tbl(x, tbl_name = "x", parent_func = "z",
  var_to_check = v2c, dt_to_check = dt2c)
# using default settings (all arguments NULL)
y2 <- check_input_tbl(x, tbl_name = "x")

test_that("correct returned object", {
  expect_equal(class(x), class(y))
  expect_equal(dim(x), dim(y))
  expect_equal(names(x), names(y))
  # check if data types are the same
  expect_equal(unlist(purrr::map(1:length(names(x)),
    ~class(x[[.]]))), unlist(purrr::map(1:length(names(y)),
    ~class(y[[.]]))))
  expect_equal(x, y)
  expect_equal(x, y2)
  expect_equal(class(x), class(y2))
  expect_equal(dim(x), dim(y2))
  expect_equal(names(x), names(y2))
})


test_that("error message", {
  expect_error(check_input_tbl(as.data.frame(x),
    "x"), "has to be a tibble")
  expect_error(check_input_tbl(as.data.frame(x),
    "x", parent_func = "z()"), "output from")
  expect_error(check_input_tbl(x, "x", var_to_check = c("a",
    "ab", "abc"), dt_to_check = dt2c), "The following variables required")
  expect_error(check_input_tbl(x, "x", var_to_check = c("a",
    "ab", "abc")), "The following variables required")  # dt_to_check for dt2c is null
  expect_error(check_input_tbl(x, "x", var_to_check = v2c,
    dt_to_check = c("list", "factor", "character")))
  # expect no error message as var_to_check set to
  # NULL
  expect_equal(x, check_input_tbl(x, "x", dt_to_check = c("list",
    "factor", "character")))
})
