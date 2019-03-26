context("Testing tibble helpers")

li <- list(
  list(a = 1, b = log10, c = "parrot", d = c(1L, 2L, 3L)) %>% add_class("myobject"),
  list(a = 2, b = sqrt, c = "quest", d = c("a", "b", "c")) %>% add_class("yourobject"),
  list(a = 4, b = exp, c = "vlissingen", d = c(pi, 2.1, 2.1e-10)) %>% add_class("theirobject")
)

tib <- tibble(
  a = c(1, 2, 4),
  b = list(log10, sqrt, exp),
  c = c("parrot", "quest", "vlissingen"),
  d = list(c(1L, 2L, 3L), c("a", "b", "c"), c(pi, 2.1, 2.1e-10)),
  .object_class = list(c("myobject", "list"), c("yourobject", "list"), c("theirobject", "list"))
)

test_that("list_as_tibble works", {
  tib2 <- list_as_tibble(li)

  expect_equal(attributes(tib2), attributes(tib))

  expect_equal(tib2$a, tib$a)
  expect_equal(tib2$b, tib$b)
  expect_equal(tib2$c, tib$c)
  expect_equal(tib2$d, tib$d)
  expect_equal(tib2$.object_class, tib$.object_class)
})

test_that("tibble_as_list works", {
  li2 <- tibble_as_list(tib)

  expect_equal(li2, li)
})


test_that("extract_row_to_list works with integers", {
  for (i in seq_len(nrow(tib))) {
    expect_equal(extract_row_to_list(tib, i), li[[i]])
  }

  expect_equal(extract_row_to_list(tib, n()), li[[length(li)]])

  for (i in seq_len(nrow(tib))) {
    expect_equal(extract_row_to_list(tib, setdiff(-seq_len(n()), -i)), li[[i]])
  }

  for (i in seq_len(nrow(tib))) {
    expect_equal(extract_row_to_list(tib, which(a == tib$a[[i]])), li[[i]])
  }
})


test_that("extract_row_to_list fails gracefully", {
  expect_null(extract_row_to_list(NULL, 1))

  expect_error(extract_row_to_list(tib, 1:2), "Multiple rows were matched")

  expect_error(extract_row_to_list(tib, integer(0)), "No rows were matched")
})

