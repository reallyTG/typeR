library(lime)


### Name: plot_superpixels
### Title: Test super pixel segmentation
### Aliases: plot_superpixels

### ** Examples

image <- system.file('extdata', 'produce.png', package = 'lime')

# plot with default settings
plot_superpixels(image)

# Test different settings
plot_superpixels(image, n_superpixels = 100, colour = 'white')




