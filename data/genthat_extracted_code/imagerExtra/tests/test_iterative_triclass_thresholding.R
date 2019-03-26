library(imagerExtra)

test_that("Iterative Triclass Thresholding",
{
  notim <- 1
  im <- boats
  gim <- grayscale(im)
  gim2 <- imrep(gim, 2) %>% imappend(., "z")
  im_uniform <- as.cimg(matrix(1,100,100))
  bad1 <- "A"
  bad2 <- -1
  bad3 <- c(1,1,1)
  bad4 <- NA
  bad5 <- NULL
  expect_error(ThresholdTriclass(notim))
  expect_error(ThresholdTriclass(im))
  expect_error(ThresholdTriclass(gim2))
  expect_error(ThresholdTriclass(im_uniform))
  expect_error(ThresholdTriclass(gim, stopval = bad1))
  expect_error(ThresholdTriclass(gim, stopval = bad2))
  expect_error(ThresholdTriclass(gim, stopval = bad3))
  expect_error(ThresholdTriclass(gim, stopval = bad4))
  expect_error(ThresholdTriclass(gim, stopval = bad5))  
  expect_error(ThresholdTriclass(gim, repeatnum = bad1))
  expect_error(ThresholdTriclass(gim, repeatnum = bad2))
  expect_error(ThresholdTriclass(gim, repeatnum = bad3))
  expect_error(ThresholdTriclass(gim, repeatnum = bad4))
  expect_error(ThresholdTriclass(gim, repeatnum = bad5))
  expect_error(ThresholdTriclass(gim, returnvalue = bad1))
  expect_error(ThresholdTriclass(gim, returnvalue = bad2))
  expect_error(ThresholdTriclass(gim, returnvalue = bad3))
  expect_error(ThresholdTriclass(gim, returnvalue = bad4))
  expect_error(ThresholdTriclass(gim, returnvalue = bad5))
  expect_error(ThresholdTriclass(gim, intervalnumber = bad1))
  expect_error(ThresholdTriclass(gim, intervalnumber = bad2))
  expect_error(ThresholdTriclass(gim, intervalnumber = bad3))
  expect_error(ThresholdTriclass(gim, intervalnumber = bad4))
  expect_error(ThresholdTriclass(gim, intervalnumber = bad5))
})