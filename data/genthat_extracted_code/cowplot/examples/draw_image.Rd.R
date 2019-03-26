library(cowplot)


### Name: draw_image
### Title: Draw an image
### Aliases: draw_image

### ** Examples

# Use image as plot background
p <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) + geom_density(alpha = 0.7)
ggdraw() +
  draw_image("http://jeroen.github.io/images/tiger.svg") +
  draw_plot(p + theme(legend.box.background = element_rect(color = "white")))

# Make grid with plot and image
p <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.7)
p2 <- ggdraw() + draw_image("http://jeroen.github.io/images/tiger.svg", scale = 0.9)
plot_grid(p, p2, labels = "AUTO")

# Manipulate images and draw in plot coordinates
if (requireNamespace("magick", quietly = TRUE)){
  img <- magick::image_read("http://jeroen.github.io/images/tiger.svg")
  img <- magick::image_transparent(img, color = "white")
  img2 <- magick::image_negate(img)
  ggplot(data.frame(x = 1:3, y = 1:3), aes(x, y)) +
    geom_point(size = 3) +
    geom_abline(slope = 1, intercept = 0, linetype = 2, color = "blue") +
    draw_image(img , x = 1, y = 1, scale = .9) +
    draw_image(img2, x = 2, y = 2, scale = .9)
}



