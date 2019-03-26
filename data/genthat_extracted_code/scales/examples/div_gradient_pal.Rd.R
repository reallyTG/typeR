library(scales)


### Name: div_gradient_pal
### Title: Diverging colour gradient (continuous).
### Aliases: div_gradient_pal

### ** Examples

x <- seq(-1, 1, length.out = 100)
r <- sqrt(outer(x^2, x^2, "+"))
image(r, col = div_gradient_pal()(seq(0, 1, length.out = 12)))
image(r, col = div_gradient_pal()(seq(0, 1, length.out = 30)))
image(r, col = div_gradient_pal()(seq(0, 1, length.out = 100)))

library(munsell)
image(r, col = div_gradient_pal(low =
   mnsl(complement("10R 4/6"), fix = TRUE))(seq(0, 1, length = 100)))



