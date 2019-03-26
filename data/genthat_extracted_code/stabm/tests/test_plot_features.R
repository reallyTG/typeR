context("plotFeatures")

sm = diag(7)
sm[1, 2] = sm[2, 1] = 0.8
sm[1, 4] = sm[4, 1] = 0.9
sm[3, 6] = sm[6, 3] = 0.5

sm2 = sm
colnames(sm2) = paste0("V", 1:7)


test_that("numeric features", {
  checkmate::expect_class(plotFeatures(list(c(2, 3, 5, 6, 7), 1:5, 2:7)),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("character features", {
  checkmate::expect_class(plotFeatures(list(paste0("V", c(2, 3, 5, 6, 7)),
    paste0("V", 1:5), paste0("V", 2:7))),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("one of three empty", {
  checkmate::expect_class(plotFeatures(list(paste0("V", c(2, 3, 5, 6, 7)),
    paste0("V", 1:5), character(0L))),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("one of two empty", {
  checkmate::expect_class(plotFeatures(list(3, integer(0L))),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("all empty", {
  expect_error(plotFeatures(list(character(0L), character(0L))),
    regexp = "No feature selected in any set!")
})

test_that("only one feature", {
  checkmate::expect_class(plotFeatures(list("V1", "V1")),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})



test_that("numeric features + sim.mat", {
  checkmate::expect_class(plotFeatures(list(c(2, 3, 5, 6, 7), 1:5, 2:7), sm),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("character features + sim.mat", {
  checkmate::expect_class(plotFeatures(list(paste0("V", c(2, 3, 5, 6, 7)),
    paste0("V", 1:5), paste0("V", 2:7)), sm2),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("one of three empty + sim.mat", {
  checkmate::expect_class(plotFeatures(list(paste0("V", c(2, 3, 5, 6, 7)),
    paste0("V", 1:5), character(0L)), sm2),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("one of two empty + sim.mat", {
  checkmate::expect_class(plotFeatures(list("V1", character(0L)), sm2),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})

test_that("only one feature + sim.mat", {
  checkmate::expect_class(plotFeatures(list("V1", "V1"), sm2),
    classes = c("gg", "ggplot"), null.ok = FALSE)
})