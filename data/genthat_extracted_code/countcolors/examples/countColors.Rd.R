library(countcolors)


### Name: countColors
### Title: Count the number of pixels within a color range or ranges
### Aliases: countColors

### ** Examples


# Try out a few different radii for white pelicans
pelicans <- system.file("extdata", "pelicans.jpg", package = "countcolors")

white.ctr <- rep(0.9, 9)
white.radii <- c(0.5, 0.3, 0.1)

# Magenta = 50% threshold, cyan = 30% threshold, yellow = 10% threshold
pelican.example <- countcolors::countColors(pelicans, center = white.ctr,
radius = white.radii, bg.lower = NULL, plotting = TRUE)




