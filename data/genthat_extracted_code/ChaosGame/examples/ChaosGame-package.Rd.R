library(ChaosGame)


### Name: ChaosGame-package
### Title: Chaos game generation of fractal words
### Aliases: ChaosGame-package ChaosGame
### Keywords: package

### ** Examples

# function with word as input, runs the chaos game and
# projects the result on the Enneper Minimal Surface:

# for nice results use, for example, R = 20 and orbit = 3000
A <- plot_word3D(word = "copula", R = 50, orbit = 100, copula = FALSE, 
                 plot.surface = "EnneperMinimalSurface", histogram = FALSE)
            
# further examples:

# same example as before, now with histogram = TRUE
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE,
#                  plot.surface = "EnneperMinimalSurface")
# same example as before, now (approximately) probability-integral-transformed 
# (i.e. copula = TRUE)
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = TRUE,
#                  plot.surface = "EnneperMinimalSurface")


# projection of the fractal on a Catalan Surface
# A <- plot_word3D(word = "copula", R = 100, orbit = 300, copula = FALSE, 
#                  color.rgl.plot = "blue2green", plot.surface = "CatalanSurface")
# Catalan Surface (approximately) probability-integral-transformed (i.e. copula = TRUE)
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
           
            



