context("include-exclude")

test_that("include/exclude both", {
  template <- data.frame(
    w = c("_", 1, 2),
    x = c(1, "_", "_"),
    y = c(1, 2, "_")
  )
  expect_error(
    wildcard(
      template,
      wildcard = "_",
      values = LETTERS[1:2],
      include = "w",
      exclude = "x"
    )
  )
})

test_that("include/exclude wrong cols", {
  template <- data.frame(
    w = c("_", 1, 2),
    x = c(1, "_", "_"),
    y = c(1, 2, "_"),
    stringsAsFactors = FALSE
  )
  big <- wildcard(template, wildcard = "_", values = LETTERS[1:2])
  big1 <- wildcard(template, wildcard = "_", values = LETTERS[1:2],
    include = colnames(template))
  big2 <- wildcard(template, wildcard = "_", values = LETTERS[1:2],
    exclude = character(0))
  big3 <- wildcard(template, wildcard = "_", values = LETTERS[1:2],
    exclude = "zoom")
  small1 <- wildcard(template, wildcard = "_", values = LETTERS[1:2],
    exclude = colnames(template))
  small2 <- wildcard(template, wildcard = "_", values = LETTERS[1:2],
    include = character(0))
  small3 <- wildcard(template, wildcard = "_", values = LETTERS[1:2],
    include = "zoom")
  expect_equal(big, big1)
  expect_equal(big, big2)
  expect_equal(big, big3)
  expect_equal(template, small1)
  expect_equal(template, small2)
  expect_equal(template, small3)
})

test_that("include/exclude basic 1", {
  template <- data.frame(
    w = c("_", 1, 2),
    x = c(1, "_", "_"),
    y = c(1, 2, "_")
  )
  out1 <- wildcard(
    template, wildcard = "_",
    values = LETTERS[1:2], include = c("w", "x")
  )
  out2 <- wildcard(
    template, wildcard = "_",
    values = LETTERS[1:2], exclude = c("w", "x")
  )
  rules1 <- wildcard(
    template, rules = list("_" = LETTERS[1:2]),
    include = c("w", "x")
  )
  rules2 <- wildcard(
    template, rules = list("_" = LETTERS[1:2]),
    exclude = c("w", "x")
  )
  ans1 <- data.frame(
    w = c("A", "B", 1, 1, 2, 2),
    x = c(1, 1, "A", "B", "A", "B"),
    y = c(1, 1, 2, 2, "_", "_"),
    stringsAsFactors = FALSE
  )
  ans2 <- data.frame(
    w = c("_", 1, 2, 2),
    x = c(1, "_", "_", "_"),
    y = c(1, 2, "A", "B"),
    stringsAsFactors = FALSE
  )
  expect_equal(ans1, out1)
  expect_equal(ans2, out2)
  expect_equal(ans1, rules1)
  expect_equal(ans2, rules2)
})

test_that("include/exclude basic 2", {
  template <- data.frame(
    w = c("_", 1, 2),
    x = c(1, "_", 2),
    y = c(1, 2, "_")
  )
  out1 <- wildcard(
    template, wildcard = "_",
    values = LETTERS[1:2], include = c("w", "x")
  )
  out2 <- wildcard(
    template, wildcard = "_",
    values = LETTERS[1:2], exclude = c("w", "x")
  )
  rules1 <- wildcard(
    template, rules = list("_" = LETTERS[1:2]),
    include = c("w", "x")
  )
  rules2 <- wildcard(
    template, rules = list("_" = LETTERS[1:2]),
    exclude = c("w", "x")
  )
  ans1 <- data.frame(
    w = c("A", "B", 1, 1, 2),
    x = c(1, 1, "A", "B", 2),
    y = c(1, 1, 2, 2, "_"),
    stringsAsFactors = FALSE
  )
  ans2 <- data.frame(
    w = c("_", 1, 2, 2),
    x = c(1, "_", 2, 2),
    y = c(1, 2, "A", "B"),
    stringsAsFactors = FALSE
  )
  expect_equal(ans1, out1)
  expect_equal(ans2, out2)
  expect_equal(ans1, rules1)
  expect_equal(ans2, rules2)
})

test_that("multiple rules", {
  template <- data.frame(
    a = c(1, 2, "A", "B", 1),
    b = c("A", 1, "B", 2, 3),
    c = c("A", 1, 2, 3, 4),
    stringsAsFactors = FALSE
  )
  out1 <- wildcard(template,
    rules = list(A = 8:9, B = 10:11),
    include = c("b", "c"))
  out2 <- wildcard(template,
    rules = list(A = 8:9, B = 10:11),
    exclude = c("b", "c"))
  out3 <- wildcard(template,
    rules = list(A = 8:9, B = 10:11),
    include = c("a", "b"))
  out4 <- wildcard(template,
    rules = list(A = 8:9, B = 10:11),
    include = c("a", "b"),
    expand = FALSE)
  out5 <- wildcard(template,
    rules = list(A = 8:9, B = 10:11),
    exclude = c("a", "b"))
  ans1 <- data.frame(
    a = c(1, 1, 2, "A", "A", "B", 1),
    b = as.character(c(8, 9, 1, 10, 11, 2, 3)),
    c = as.character(c(8, 9, 1, 2, 2, 3, 4)),
    stringsAsFactors = FALSE
  )
  ans2 <- data.frame(
    a = as.character(c(1, 2, 8, 9, 10, 11, 1)),
    b = c("A", 1, "B", "B", 2, 2, 3),
    c = c("A", 1, 2, 2, 3, 3, 4),
    stringsAsFactors = FALSE
  )
  ans3 <- data.frame(
    a = as.character(c(1, 1, 2, 8, 8, 9, 9, 10, 11, 1)),
    b = as.character(c(8, 9, 1, 10, 11, 10, 11, 2, 2, 3)),
    c = c("A", "A", 1, 2, 2, 2, 2, 3, 3, 4),
    stringsAsFactors = FALSE
  )
  ans4 <- data.frame(
    a = as.character(c(1, 2, 8, 10, 1)),
    b = as.character(c(8, 1, 10, 2, 3)),
    c = c("A", 1, 2, 3, 4),
    stringsAsFactors = FALSE
  )
  ans5 <- data.frame(
    a = c(1, 1, 2, "A", "B", 1),
    b = c("A", "A", 1, "B", 2, 3),
    c = as.character(c(8, 9, 1, 2, 3, 4)),
    stringsAsFactors = FALSE
  )
  expect_equal(ans1, out1)
  expect_equal(ans2, out2)
  expect_equal(ans3, out3)
  expect_equal(ans4, out4)
  expect_equal(ans5, out5)
})
