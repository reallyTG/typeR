context("Test main functions")

test_that("test zones",{
  
  # filename
  x <- system.file("extdata", "yangambi.png",
                          package = "foto",
                          mustWork = TRUE)
  
  # classify pixels using zones
  expect_output(str(foto(x = raster::raster(x), plot = FALSE)))
  expect_output(str(foto(x = raster::brick(x), plot = FALSE)))
  expect_output(str(foto(x = x, plot = FALSE)))
  expect_output(str(foto(x = raster::raster(x), plot = TRUE)))
  
  # no image
  expect_error(foto())
  expect_error(foto(x = "./no_image.png"))
  
  # faulty method
  expect_error(foto(x = raster::raster(x),
                         plot = FALSE,
                         method = "xx"))
  
})

test_that("test mw",{
  
  # test moving window
  r <- raster::crop(raster::raster(system.file("extdata", "yangambi.png",
                                               package = "foto",
                                               mustWork = TRUE)),
                    raster::extent(1,30,1,30))
  
  # test moving window
  expect_output(str(foto(r,
                         plot = FALSE,
                         window_size = 25,
                         method = "mw")))
})

test_that("test normalization",{
  x <- c(1,5,10)
  expect_output(str(normalize(x)))
  expect_error(normalize())
})
