library(TreeLS)


### Name: stem.hough
### Title: Stem denoising algorithm: Hough Transform
### Aliases: stem.hough

### ** Examples

file = system.file("extdata", "spruce.laz", package="TreeLS")
tls = readTLS(file)

### identify stem points
tls = stemPoints(tls, method = stem.hough(max_radius=.2))
plot(tls, color='Stem')




