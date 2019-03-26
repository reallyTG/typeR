context("test place_text")

x <- range(press_ex[, 2])
y <- range(ind_ex[, 12], na.rm = TRUE)
x_prop <- 0.1
y_prop <- 0.1
pos <- "topleft"
dat <- place_text(x, y, x_prop, y_prop, pos = pos)

test_that("test_place_text", {
  expect_equal(round(dat$x, 5), 13.60461)
  expect_equal(round(dat$y, 6), 9.714304)
  expect_error(place_text(x, y, x_prop, y_prop, pos = "somewhere"))
})
