context("wildcard")

test_that("single-column data.frames work", {
  df <- data.frame(x = "AB")
  out <- wildcard(df,
    rules = list(
      A = head(letters, 3),
      B = tail(letters, 3)))
  truth <- data.frame(
    x = c("ax", "ay", "az", "bx",
      "by", "bz", "cx", "cy", "cz"),
    stringsAsFactors = FALSE)
  expect_equal(out, truth)
})

test_that("expanded df works", {
  df <- data.frame(
    x = c(1, 2, "x", "x", 3),
    y = c("a", "b", "c", "x_y", "x_x"),
    stringsAsFactors = TRUE)
  out <- wildcard(df,
    wildcard = "x",
    values = c(1111, 2222),
    expand = TRUE)
  truth <- data.frame(
    x = as.character(
      c(1, 2, 1111, 2222, 1111, 2222, 3, 3)),
    y = as.character(
      c("a",  "b", "c", "c", "1111_y", "2222_y", "1111_1111",
      "2222_2222")),
    stringsAsFactors = FALSE)
  expect_equal(out, truth)
})

test_that("rules arg works works", {
  df <- data.frame(
    x = c(1, 2, "x", "x", 3),
    y = c("a", "b", "c", "x_y", "x_x"),
    z = c("device1", "device2", "device1", "device1", "isomorphism"),
    stringsAsFactors = TRUE)
  out <- wildcard(df,
    rules = list(
      x = c(1111, 2222),
      y = LETTERS[1:3],
      device2 = c("noise1", "noise2")),
    expand = TRUE)
  truth <- data.frame(
    x = as.character(
      c(1, 2, 2, 1111, 2222, 1111, 1111, 1111, 2222, 2222, 2222, 3, 3)),
    y = c("a", "b", "b", "c", "c", "1111_A",
      "1111_B", "1111_C", "2222_A", "2222_B", "2222_C",
      "1111_1111", "2222_2222"),
    z = c("device1", "noise1", "noise2", rep("device1", 8),
      "isomorphism", "isomorphism"),
    stringsAsFactors = FALSE)
  expect_equal(out, truth)
})

test_that("expand = FALSE works", {
  df <- data.frame(
    x = c(1, 2, "x", "x", 3),
    y = c("a", "b", "c", "x_y", "x_x"),
    z = c("device1", "device2", "device1", "device1", "isomorphism"),
    stringsAsFactors = TRUE)
  out <- wildcard(df,
    rules = list(
      x = c(1111, 2222),
      y = LETTERS[1:3],
      device2 = c("noise1", "noise2")),
    expand = FALSE)
  truth <- data.frame(
    x = as.character(c(1, 2, 1111, 2222, 3)),
    y = c("a", "b", "c", "1111_A", "2222_2222"),
    z = c("device1", "noise1", rep("device1", 2),
      "isomorphism"),
    stringsAsFactors = FALSE)
  expect_equal(out, truth)
})
