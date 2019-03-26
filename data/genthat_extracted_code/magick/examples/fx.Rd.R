library(magick)


### Name: fx
### Title: Image FX
### Aliases: fx image_fx

### ** Examples

# Show image_fx() expression
img <- image_convert(logo, colorspace = "Gray")
image_fx(img, expression = "pow(p, 0.5)")
image_fx(img, expression = "random()")

gradient_x <- image_convolve(img, kernel = "Prewitt")
gradient_y <- image_convolve(img, kernel = "Prewitt:90")
gradient <- c(image_fx(gradient_x, expression = "p^2"),
                image_fx(gradient_y, expression = "p^2"))
gradient <- image_flatten(gradient, operator = "Plus")
gradient <- image_fx(gradient, expression = "sqrt(p)")
gradient



