context("Response surface evaluation")

test_that('statistics', {

  expect_true(inherits(rs, "ResponseSurface"))
  expect_true(inherits(rs$meanR, "meanR"))
  expect_true(inherits(rs$maxR, "maxR"))

  expect_identical(rs$transforms, transforms)
  expect_identical(rs$meanR,
                   meanR(data, fit, transforms, "loewe", R, rs$CP, reps))

  ## Check equality without the attributes
  expect_equal(
      rs$maxR,
      maxR(data, fit, null_model = "loewe", B.CP = NULL,
          B.B = NULL, cutoff = 0.95, Ymean = offAxisTable,
          CP = rs$CP, reps = reps), 
      check.attributes = FALSE, 
      tolerance = 1e-4
  )


  ## Check for correct classes and outputs if both are bootstrapped
  rs <- fitSurface(data, fit, statistic = "both",
                   B.CP = 2, B.B = 2, parallel = FALSE)

  expect_true(inherits(rs, "ResponseSurface"))
  expect_true(inherits(rs$meanR, "meanR"))
  expect_true(inherits(rs$maxR, "maxR"))
  expect_identical(rs$transforms, transforms)

})

test_that("plots", {
      contour(rs)
      contour(rs, xlab = "x-label", ylab = "y-label")
      
      plot(rs, "maxR")
      rgl.close()
    })
