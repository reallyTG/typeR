context("vertErrorBar()")

test_that("Checks errors in vertErrorBar()", {

   x <- 1:3

   expect_error(vertErrorBar("7", 1), "'x' must be numeric")
   expect_error(vertErrorBar(x, 1, center = "l", barLength = 6), "'center' must be numeric or NULL")
   expect_error(vertErrorBar(x, 1, center = 4, barLength = c(6, 2)), "Length of 'barLength' must be 1 or the length of 'x'")
   expect_error(vertErrorBar(x, 1, center = 4, max.y = 5), "'center' and 'barLength' must be specified together")
   expect_error(vertErrorBar(x, 1, max.y = 5), "'min.y' and 'max.y' must be specified together")
   expect_error(vertErrorBar(x, 1), "Either 'center' and 'barLength' must be specified, or 'min.y' and 'max.y' must be specified")
   expect_error(vertErrorBar(x, 1, min.y = 3, max.y = 1), "All elements of 'min.y' must be less than or equal to the corresponding")
   expect_error(vertErrorBar(x, -1, center = 3, barLength = 6), "all values of 'width' must be non-negative")
   expect_error(vertErrorBar(x, -1, center = 3, barLength = -c(1:3)), "all values of 'barLength' must be non-negative")

})
