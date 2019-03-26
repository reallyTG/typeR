context("parseJob()")

test_that("parseJob() doesn't deviate from historical behavior", {
 
  x1 <- parseJob(29, 6)
  x2 <- parseJob(32, 5, random.seed = 231)
  x3 <- parseJob(11, 3, text.to.eval = TRUE)
  x4 <- parseJob(11, 3, collate = TRUE)
  x5 <- parseJob(11, 3, collate = TRUE, text.to.eval = TRUE)

  xout <- list(x1 = x1, x2 = x2, x3 = x3, x4 = x4, x5 = x5)

  # This is a one-time deal
  # save(xout, file = "validationData/parseJob.Rdata")

  xin <- loadObject("validationData/parseJob.Rdata")

  expect_equal(xout, xin)
    
})
