library(colorfindr)


### Name: plot_colors_3d
### Title: Create interactive 3D scatterplots of image color compositions
### Aliases: plot_colors_3d

### ** Examples

# Extract all colors
pic1 <- system.file("extdata", "pic5.png", package = "colorfindr")
col <- get_colors(pic1)

# Plot image composition
plot_colors_3d(col)




