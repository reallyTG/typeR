library(ChaosGame)


### Name: plot_word3D
### Title: Plot the 3D fractal containing the chosen word
### Aliases: plot_word3D

### ** Examples

# function with a word as input, runs the chaos game, calculates the
# copula transformation and projects the result on a sphere:

# for nice results use, for example, R = 20 and orbit = 3000
A <- plot_word3D(word = "copula", copula = FALSE, R = 50, orbit = 100)


# further examples:

# projection of the fractal on the Enneper Minimal Surface:
# A <- plot_word3D(word = "copula", R = 75, orbit = 300, copula = FALSE, 
#                  plot.surface = "EnneperMinimalSurface", histogram = FALSE)
# same example as before, now with histogram = TRUE
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, 
#                  plot.surface = "EnneperMinimalSurface")
# same example as before (approximately) probability-integral-transformed 
# (i.e. copula = TRUE)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = TRUE, 
#                  plot.surface = "EnneperMinimalSurface")


# projection of the fractal on a Catalan Surface
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, 
#                  color.rgl.plot = "blue2green", plot.surface = "CatalanSurface")
# Catalan Surface (approximately) probability-integral-transformed 
# (i.e. copula = TRUE)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = TRUE, 
#                  color.rgl.plot = "blue2green", plot.surface = "CatalanSurface")


# projection of the fractal on a Helix
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, 
#                  color.rgl.plot = "green2red", plot.surface = "Helix")
# Helix (approximately) probability-integral-transformed (i.e. copula = TRUE)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = TRUE, 
#                  color.rgl.plot = "green2red", plot.surface = "Helix")


# projection of the fractal on a Torus
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, 
#                  color.rgl.plot = "blue2yellow", plot.surface = "Torus")
# Torus (approximately) probability-integral-transformed (i.e. copula = TRUE)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = TRUE, 
#                  color.rgl.plot = "blue2yellow", plot.surface = "Torus")


# projection of the fractal on a Sphere
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, 
#                  color.rgl.plot = "ygobb", plot.surface = "Sphere")
# Sphere (approximately) probability-integral-transformed (i.e. copula = TRUE)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = TRUE, 
#                  color.rgl.plot = "ygobb", plot.surface = "Sphere")



# scatter-plot with plot3D (i.e. plot.rgl = FALSE) 
# A <- plot_word3D(word = "copula", R = 10, orbit = 300, copula = FALSE, 
#                  plot.surface = "Sphere", plot.rgl = FALSE)


# scatter-plot with plot3D (i.e. plot.rgl = FALSE) for exporting as a pdf file
# setwd("working_directory")
# pdf(file = "Sphere.pdf", width = 30, height = 25)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, plot.rgl = FALSE, 
#                  plot.surface = "Sphere", cex.label = 1.8, size.lines = 0.001)
# dev.off()


# scatter-plot with plot3D (i.e. plot.rgl = FALSE) for exporting as a png file
# setwd("working_directory")
# png(file = "Sphere.png", width = 5000, height = 4000)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, plot.rgl = FALSE, 
#                  plot.surface = "Sphere", cex.label = 5, size.lines = 2)
# dev.off()



