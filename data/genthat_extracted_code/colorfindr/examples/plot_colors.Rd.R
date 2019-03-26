library(colorfindr)


### Name: plot_colors
### Title: Create treemaps of image color compositions
### Aliases: plot_colors

### ** Examples

# Extract all colors
pic1 <- system.file("extdata", "pic1.png", package = "colorfindr")
col <- get_colors(pic1)

# Plot image composition
plot_colors(col)




