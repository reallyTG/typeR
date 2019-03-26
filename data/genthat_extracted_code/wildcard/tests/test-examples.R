context("examples")

test_that("main example", {
  myths <- data.frame(
    myth = c("Bigfoot", "UFO", "Loch Ness Monster"),
    claim = c("various", "day", "day"),
    note = c("various", "pictures", "reported day"))
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

test_that("non-expanded example", {
  myths <- data.frame(
    myth = c("Bigfoot", "UFO", "Loch Ness Monster"),
    claim = c("various", "day", "day"),
    note = c("various", "pictures", "reported day"))
  out <- wildcard(myths, wildcard = "day",
    values = c("today", "yesterday"), expand = FALSE)
  ans <- data.frame(
    myth = c("Bigfoot", "UFO", "Loch Ness Monster"),
    claim = c("various", "today", "yesterday"),
    note = c("various", "pictures", "reported today"),
    stringsAsFactors = FALSE)
  expect_equal(out, ans)
})

test_that("expand = vector example", {
  locations <- data.frame(
    myth = c("Bigfoot", "UFO", "Loch Ness Monster"),
    origin = "where")
  rules <- list(
    where = c("North America", "various", "Scotland"),
    UFO = c("spaceship", "saucer"))
  out <- wildcard(locations, rules = rules,
    expand = c(FALSE, TRUE))
  ans <- data.frame(
    myth = c("Bigfoot", "spaceship", "saucer", "Loch Ness Monster"),
    origin = c("North America", "various", "various", "Scotland"),
    stringsAsFactors = FALSE)
  expect_equal(out, ans)
})

test_that("expand example", {
  df <- data.frame(
    ID = c("24601", "Javert", "Fantine"),
    fate = c("fulfillment", "confusion", "misfortune"))
  expect_equal(expandrows(df, n = 1), df)
  out <- expandrows(df, n = 2, type = "each")
  ans <- data.frame(
    ID = c(24601, 24601, "Javert", "Javert", "Fantine", "Fantine"),
    fate = c("fulfillment", "fulfillment", "confusion",
      "confusion", "misfortune", "misfortune"))
  expect_equal(out, ans)
  out <- expandrows(df, n = 2)
  expect_equal(out, ans)
  out <- expandrows(df, n = 3, type = "times")
  df <- nofactors(df)
  id <- df$ID
  fate <- df$fate
  ans <- data.frame(
    ID = c(id, id, id),
    fate = c(fate, fate, fate))
  expect_equal(out, ans)
})

test_that("nofactors example", {
  expect_is(iris$Species, "factor")
  out <- nofactors(iris)
  expect_is(out$Species, "character")
})
