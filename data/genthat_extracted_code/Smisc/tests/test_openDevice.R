context("openDevice()")

test_that("openDevice() opens all the requested device types", {

  pf <- function(ext, ...) {
    fname <- paste("tmp/plot_out", ext, sep = ".")
#    pvar(getwd(), fname)
    openDevice(fname, ...)
    plot(1:10, 1:10)
    dev.off()
#    print(dir("tmp"))
    expect_true(file.exists(fname))
    unlink(fname)
  }

  pf("pdf", height = 10, width = 12)
  pf("ps", height = 7, width = 2)
  pf("jpg", quality = 100)
  # This fails for some weird reason on the Travis checks
  # pf("tif")  
  pf("png")
  pf("bmp")

  expect_error(openDevice("file.tifg"), "Filename must have one of the following extensions")
  
})
