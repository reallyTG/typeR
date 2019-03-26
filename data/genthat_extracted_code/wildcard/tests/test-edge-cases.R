context("edge cases")

test_that("df is empty", {
  df <- data.frame(
    x = character(0),
    y = character(0),
    stringsAsFactors = TRUE)
  expect_error(out <- wildcard(df,
    wildcard = "not_found",
    values = c(1111, 2222)))
})

test_that("null cases", {
  df <- data.frame(
    x = c(1, 2, "x", "x", 3),
    y = c("a", "b", "c", "x_y", "x_x"),
    stringsAsFactors = TRUE)
  out <- wildcard(df,
    wildcard = "not_found",
    values = c(1111, 2222),
    expand = TRUE)
  expect_equal(nofactors(df), out)
  out <- wildcard(df,
    rules = list(not_found = c(1111, 2222)),
    expand = FALSE)
  expect_equal(nofactors(df), out)
  out <- wildcard(df, rules = list(), expand = FALSE)
  expect_equal(nofactors(df), out)
  out <- wildcard(df, wildcard = NULL, values = NULL,
    expand = FALSE)
  expect_equal(nofactors(df), out)
  expect_error(wildcard(df, rules = c(a = 1), expand = FALSE))
})

test_that("df is a matrix", {
  myths <- data.frame(
    myth = c("Bigfoot", "UFO", "Loch Ness Monster"),
    claim = c("various", "day", "day"),
    note = c("various", "pictures", "reported day"))
  myths <- as.matrix(myths)
  out <- wildcard(myths, wildcard = "day",
                  values = c("today", "yesterday"))
  ans <- data.frame(
    myth = c("Bigfoot", "UFO", "UFO", "Loch Ness Monster", "Loch Ness Monster"),
    claim = c("various", "today", "yesterday", "today", "yesterday"),
    note = c("various", rep("pictures", 2),
             "reported today", "reported yesterday"),
    stringsAsFactors = FALSE)
  expect_equal(out, ans)
})

test_that("expanded df works with blank col", {
  df <- data.frame(
    x = c(1, 2, "x", 3),
    y = c("a", "b", "c", "x_x"),
    z = 1:4,
    stringsAsFactors = TRUE)
  out <- wildcard(df, wildcard = "x",
    values = c(1111, 2222),
    expand = TRUE)
  truth <- data.frame(
    x = as.character(c(1, 2, 1111, 2222, 3, 3)),
    y = as.character(c("a", "b", "c", "c", "1111_1111", "2222_2222")),
    z = c(1, 2, 3, 3, 4, 4),
    stringsAsFactors = FALSE)
  expect_equal(out, truth)
})

test_that("warnings happen when wildcards and values mix", {
  df <- data.frame(x = "a", y = "b")
  rules <- list(a = letters[1:3], b = LETTERS[1:3])
  expect_warning(out <- wildcard(df, rules = rules))
  x <- LETTERS[1:3]
  ans <- data.frame(
    x = c(rep("a", 3), x, rep("c", 3)),
    y = c(x, x, x), stringsAsFactors = FALSE)
  expect_equal(out, ans)
})
