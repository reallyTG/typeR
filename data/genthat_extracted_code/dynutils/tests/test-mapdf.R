context("Testing mapdf functions")

tib <- tibble(
  a = c(1, 2),
  b = list(log10, sqrt),
  c = c("parrot", "quest"),
  d = list(c(1,2,3), c("a", "b", "c")),
  e = c(TRUE, FALSE),
  .object_class = list(c("myobject", "list"), c("yourobject", "list"))
)

test_that("Testing whether mapdf works", {
  expect_equal(mapdf(tib, class), tib$.object_class)
  expect_equal(mapdf(tib, function(row) class(row)), tib$.object_class)
  expect_equal(mapdf(tib, ~class(.)), tib$.object_class)
})

test_that("Testing whether mapdf_lgl works", {
  expect_equal(mapdf_lgl(tib, is.list), c(TRUE, TRUE))
  expect_equal(mapdf_lgl(tib, function(row) row$a > 1), tib$a > 1)
  expect_equal(mapdf_lgl(tib, ~.$e), tib$e)
})

test_that("Testing whether mapdf_chr works", {
  expect_equal(mapdf_chr(tib, glue::glue_collapse), c("1.Primitive(\"log10\")parrotc(1, 2, 3)TRUE", "2.Primitive(\"sqrt\")questc(\"a\", \"b\", \"c\")FALSE"))
  expect_equal(mapdf_chr(tib, function(row) paste0("~", row$e, "~")), paste0("~", tib$e, "~"))
  expect_equal(mapdf_chr(tib, ~.$c), tib$c)
})

test_that("Testing whether mapdf_int works", {
  expect_equal(mapdf_int(tib, length), c(5L, 5L))
  expect_equal(mapdf_int(tib, function(row) as.integer(row$a * 10L)), as.integer(tib$a * 10))
  expect_equal(mapdf_int(tib, ~nchar(.$c)), c(6, 5))
})

test_that("Testing whether mapdf_dbl works", {
  expect_equal(mapdf_dbl(tib, function(row) row$b(row$a)), c(log10(1), sqrt(2)))
  expect_equal(mapdf_dbl(tib, ~.$a * 1.5), c(1.5, 3.0))
})

test_that("Testing whether mapdf_dfr works", {
  out <- mapdf_dfr(tib, function(row) {
    data_frame(a = 1, b = row$e, c = row$a)
  })
  expect_equal(out, data_frame(a = c(1, 1), b = c(TRUE, FALSE), c = c(1, 2)))
})

test_that("Testing whether mapdf_lat works", {
  out <- mapdf_lat(tib, function(row) {
    list(a = 1, b = row$e, c = row$a, d = list(row$c, row$a)) %>% add_class("test")
  })
  expected_out <- tibble(
    a = c(1, 1),
    b = c(TRUE, FALSE),
    c = c(1, 2),
    d = list(list("parrot", 1), list("quest", 2)),
    .object_class = list(c("test", "list"), c("test", "list"))
  )

  expect_equal(colnames(out), colnames(expected_out))
  walk(colnames(out), ~ expect_equal(out[[.]], expected_out[[.]]))
})

test_that("Testing whether mapdf_dfc works", {
  out <- mapdf_dfc(tib, function(row) {
    o <- data_frame(row$d)
    colnames(o) <- row$c
    o
  })
  expect_equal(out, data_frame(parrot = c(1,2,3), quest = c("a", "b", "c")))
})

test_that("Testing whether walkdf works", {
  expect_message(walkdf(tib[1, ], ~ message(.$c)), "parrot")
  expect_error(walkdf(tib[2, ], ~ stop(.$c)), "quest")
  expect_error(walkdf(tib, ~ length(.)), NA)
})

test_that("Testing whether mapdf_fun works", {
  mapdf_int2 <- mapdf_fun(purrr::map_int)

  expect_equal(mapdf_int2(tib, length), c(5L, 5L))
  expect_equal(mapdf_int2(tib, function(row) as.integer(row$a * 10L)), as.integer(tib$a * 10))
  expect_equal(mapdf_int2(tib, ~nchar(.$c)), c(6, 5))
})

