context("Test the glance method: glance.timedist")

test_that("Ensure the glance method is returning expected values", {
  data   <- lobelia[lobelia$Temperature == 12.5, ]
  data   <- tdData(data, x = "Day", y = "Germination")
  model  <- timedist(data, x = "Day", y = "propMax", r = 0.1, c = 0.5, t = 10)
  out    <- as.data.frame(glance(model))
  expect <- structure(
    list(
      sigma = 0.0595516186299733, isConv = TRUE, finTol = 1.49011611938477e-08,
      logLik = 21.3157601682213, AIC = -34.6315203364427,
      BIC = -32.0752910179816, deviance = 0.0390103480959477, df.residual = 11L,
      RSS = 0.968195658520631
    ),
    class = "data.frame", row.names = c(NA, -1L)
  )
  expect_equal(out, expect)
})
