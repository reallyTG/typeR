library(nandb)


### Name: matrix_raster_plot
### Title: Make a raster plot of a matrix.
### Aliases: matrix_raster_plot

### ** Examples

img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = 'nandb'))
ijtiff::display(img[, , 1, 1])
matrix_raster_plot(img[, , 1, 1])
b <- brightness(img, def = "B", detrend = FALSE, thresh = "Huang")
matrix_raster_plot(b, scale_name = 'brightness')
matrix_raster_plot(b, scale_name = 'brightness', log_trans = TRUE)
matrix_raster_plot(b, scale_name = 'brightness', log_trans = TRUE,
                   include_breaks = 1.35)
matrix_raster_plot(b, scale_name = 'brightness', log_trans = TRUE,
                   breaks = 1:3)
matrix_raster_plot(b, scale_name = 'brightness',
                   ranges = seq(0.5, 3, length.out = 6),
                   range_names = paste0(1:5, 'mer'))
matrix_raster_plot(b, scale_name = "brightness",
                   ranges = seq(0.5, 3, length.out = 6),
                   range_names = paste0(1:5, "mer"), log_trans = TRUE)
matrix_raster_plot(b, scale_name = "brightness",
                   include_breaks = 1.25, range_names = NULL,
                   log_trans = FALSE)
matrix_raster_plot(b, scale_name = "brightness",
                   include_breaks = 1.25, log_trans = TRUE)
matrix_raster_plot(b, scale_name = "brightness",
                   limits = c(1, 1.25), clip = TRUE)
matrix_raster_plot(b, scale_name = "brightness",
                   include_breaks = 1.25)




