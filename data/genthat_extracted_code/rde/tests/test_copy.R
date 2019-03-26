context("copy data")

test_that("line widths are as expected", {
  encoded <- copy_rde_var(iris, line.width = -1, no.clipboard = TRUE)
  expect_false(grepl("\\n", encoded))

  encoded <- copy_rde_var(iris, line.width = 80, no.clipboard = TRUE)
  encoded_lines <- strsplit(encoded, "\n")[[1]]
  sapply(encoded_lines[-length(encoded_lines)], function(l) {
    # the last line may be shorter
    expect_equal(nchar(l), 80)
  })
  expect_lte(nchar(encoded_lines[length(encoded_lines)]), 80)

  encoded <- copy_rde_var(iris, line.width = 120, no.clipboard = TRUE)
  encoded_lines <- strsplit(encoded, "\n")[[1]]
  sapply(encoded_lines[-length(encoded_lines)], function(l) {
    # the last line may be shorter
    expect_equal(nchar(l), 120)
  })
  expect_lte(nchar(encoded_lines[length(encoded_lines)]), 120)

  encoded <- copy_rde_var(iris, line.width = 1, no.clipboard = TRUE)
  encoded_lines <- strsplit(encoded, "\n")[[1]]
  sapply(encoded_lines, function(l) {
    expect_equal(nchar(l), 1)
  })
})

test_that("copied data.frame (no line breaks) can be encoded and decoded", {
  encoded <- copy_rde_var(iris, line.width = -1, no.clipboard = TRUE)
  expect_type(encoded, "character")
  expect_false(grepl("\\n", encoded))

  decoded <- load_rde_var(use.cache = TRUE, load.fcn = {}, encoded)  # nolint
  expect_identical(iris, decoded)
})

test_that("copied data.frame (line breaks) can be encoded and decoded", {
  encoded <- copy_rde_var(iris, line.width = 80, no.clipboard = TRUE)
  expect_type(encoded, "character")
  expect_true(grepl("\\n", encoded))
  decoded <- load_rde_var(use.cache = TRUE, load.fcn = {}, encoded)  # nolint
  expect_identical(iris, decoded)
})

test_vector <- function(vec, add.linebreaks) {
  encoded <- copy_rde_var(vec, line.width = if (add.linebreaks) 80L else -1L,
                           no.clipboard = TRUE)
  expect_type(encoded, "character")  # nolint
  expect_equal(grepl("\\n", encoded), add.linebreaks)  # nolint
  decoded <- load_rde_var(use.cache = TRUE, load.fcn = {}, encoded)  # nolint
  expect_identical(vec, decoded)  # nolint
}

test_that("copied atomic vector (character) encoded and decoded correctly", {
  test_vector("test vector", FALSE)
})

test_that("copied atomic vector (integer) encoded and decoded correctly", {
  test_vector(44L, FALSE)
})

test_that("copied atomic vector (float) encoded and decoded correctly", {
  test_vector(1.1, FALSE)
})

test_that("copied atomic vector (boolean) encoded and decoded correctly", {
  test_vector(TRUE, FALSE)
})

test_that("copied matrix (of floats) encoded and decoded correctly", {
  test_vector(matrix(2.1 * (1:100), nrow = 20), FALSE)
  test_vector(matrix(2.1 * (1:100), nrow = 20), TRUE)
})

test_that("copied list is encoded and decoded correctly", {
  test_list <- list(
    a = 1L:10L,
    b = seq(1.1, 5.5, 2),
    c = "some string",
    d = c(FALSE, TRUE, TRUE),
    e = list(
      a = 1:10,
      b = FALSE,
      c = matrix(1:100, nrow = 2)
    )
  )
  test_vector(test_list, FALSE)
  test_vector(test_list, TRUE)
})
