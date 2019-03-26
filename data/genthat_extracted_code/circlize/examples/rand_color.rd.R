library(circlize)


### Name: rand_color
### Title: Generate random colors
### Aliases: rand_color

### ** Examples

plot(NULL, xlim = c(1, 10), ylim = c(1, 8), axes = FALSE, ann = FALSE)
points(1:10, rep(1, 10), pch = 16, cex = 5, 
    col = rand_color(10, luminosity = "random"))
points(1:10, rep(2, 10), pch = 16, cex = 5, 
    col = rand_color(10, luminosity = "bright"))
points(1:10, rep(3, 10), pch = 16, cex = 5, 
    col = rand_color(10, luminosity = "light"))
points(1:10, rep(4, 10), pch = 16, cex = 5, 
    col = rand_color(10, luminosity = "dark"))
points(1:10, rep(5, 10), pch = 16, cex = 5, 
    col = rand_color(10, hue = "red", luminosity = "bright"))
points(1:10, rep(6, 10), pch = 16, cex = 5, 
    col = rand_color(10, hue = "green", luminosity = "bright"))
points(1:10, rep(7, 10), pch = 16, cex = 5, 
    col = rand_color(10, hue = "blue", luminosity = "bright"))
points(1:10, rep(8, 10), pch = 16, cex = 5, 
    col = rand_color(10, hue = "monochrome", luminosity = "bright"))



