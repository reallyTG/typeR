testthat::context("test_unnest_simulation.R")

s <- simTool::expand_tibble(a = 1:2, b = 3, results = list(r1 = 1L, r2 = 2L))
e <- list(simulation = s)
expected_df <- list(simulation = structure(list(a = c(1L, 2L, 1L, 2L), b = c(
  3,
  3, 3, 3
), results = c(1L, 1L, 2L, 2L)), out.attrs = list(dim = c(
  a = 2L,
  b = 1L, results = 2L
), dimnames = list(
  a = c("a=1", "a=2"), b = "b=3",
  results = c("results=1", "results=2")
)), row.names = c(
  NA,
  -4L
), class = c("tbl_df", "tbl", "data.frame")))

test_that("Simple unnesting", {
    expect_equal(simTool:::unnest_simulation(e), expected_df)  
})


s <- simTool::expand_tibble(a = 1:2, df = list(matrix(1:6, 3, 2), matrix(1:8, 4, 2)), results = list(r1 = 1L, r2 = 2L))
e <- list(simulation = s)

expected_df <- structure(list(simulation = structure(list(a = c(
  1L, 2L, 1L,
  2L, 1L, 2L, 1L, 2L
), df = list(structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(3L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
)), structure(1:8, .Dim = c(4L, 2L)), structure(1:6, .Dim = c(
  3L,
  2L
)), structure(1:6, .Dim = c(3L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
)), structure(1:8, .Dim = c(4L, 2L))), results = c(
  1L, 1L,
  1L, 1L, 2L, 2L, 2L, 2L
)), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, -8L), .Names = c("a", "df", "results"))), .Names = "simulation")


test_that("Unnesting with further matrices in the row", {
  expect_identical(simTool:::unnest_simulation(e), expected_df)
})

s <- simTool::expand_tibble(a = 1:2, df = list(matrix(1:6, 3, 2), matrix(1:8, 4, 2)), results = list(r1 = as.data.frame(matrix(1:4, 2, 2)), r2 = as.data.frame(matrix(1:9, 3, 3))))
e <- list(simulation = s)
expected_df <- structure(list(simulation = structure(list(a = c(
  1L, 1L, 2L,
  2L, 1L, 1L, 2L, 2L, 1L, 1L, 1L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 2L,
  2L
), df = list(structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(
  3L,
  2L
)), structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(
  3L,
  2L
)), structure(1:8, .Dim = c(4L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
)), structure(1:8, .Dim = c(4L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
)), structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(
  3L,
  2L
)), structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(
  3L,
  2L
)), structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(
  3L,
  2L
)), structure(1:8, .Dim = c(4L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
)), structure(1:8, .Dim = c(4L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
)), structure(1:8, .Dim = c(4L, 2L)), structure(1:8, .Dim = c(
  4L,
  2L
))), V1 = c(
  1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 3L, 1L,
  2L, 3L, 1L, 2L, 3L, 1L, 2L, 3L
), V2 = c(
  3L, 4L, 3L, 4L, 3L, 4L,
  3L, 4L, 4L, 5L, 6L, 4L, 5L, 6L, 4L, 5L, 6L, 4L, 5L, 6L
), V3 = c(
  NA,
  NA, NA, NA, NA, NA, NA, NA, 7L, 8L, 9L, 7L, 8L, 9L, 7L, 8L, 9L,
  7L, 8L, 9L
)), class = c("tbl_df", "tbl", "data.frame"), row.names = c(
  NA,
  -20L
), .Names = c("a", "df", "V1", "V2", "V3"))), .Names = "simulation")



test_that("Unnesting with further matrices in the row and result itself contains data.frames", {
  expect_identical(simTool:::unnest_simulation(e), expected_df)
})



x <- 1:2
y <- 2:3
s <- simTool::expand_tibble(a = 1:2, b = 2:3, results = list(lm(y ~ x)))
e <- list(simulation = s)
test_that("If unnesting is not possible, then nothing is changed", {
  expect_identical(simTool:::unnest_simulation(e), e)
})
