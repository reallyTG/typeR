library(magick)


### Name: analysis
### Title: Image Analysis
### Aliases: analysis image_compare image_compare_dist image_fft

### ** Examples

out1 <- image_blur(logo, 3)
out2 <- image_oilpaint(logo, 3)
input <- c(logo, out1, out2, logo)
if(magick_config()$version >= "6.8.7"){
  diff_img <- image_compare(input, logo, metric = "AE")
  attributes(diff_img)
}



