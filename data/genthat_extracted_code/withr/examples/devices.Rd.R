library(withr)


### Name: devices
### Title: Graphics devices
### Aliases: devices with_dev with_device with_bmp local_bmp with_cairo_pdf
###   local_cairo_pdf with_cairo_ps local_cairo_ps with_pdf local_pdf
###   with_postscript local_postscript with_svg local_svg with_tiff
###   local_tiff with_xfig local_xfig with_png local_png with_jpeg
###   local_jpeg

### ** Examples

# dimensions are in inches
with_pdf(file.path(tempdir(), "test.pdf"), width = 7, height = 5,
  plot(runif(5))
)

# dimensions are in pixels
with_png(file.path(tempdir(), "test.png"), width = 800, height = 600,
  plot(runif(5))
)



