library(export)


### Name: rgl2bitmap
### Title: Save currently active rgl 3D graph to bitmap format
### Aliases: rgl2bitmap rgl2png rgl2png

### ** Examples

# Create a file name
filen <- tempfile(pattern = "rgl") # or 
# filen <- paste("YOUR_DIR/rgl")

# Generate a 3D plot using 'rgl'
x = y = seq(-10, 10, length = 20)
z = outer(x, y, function(x, y) x^2 + y^2)
rgl::persp3d(x, y, z, col = 'lightblue')

# Save the plot as a png
rgl2png(file = filen)
# Note that omitting 'file' will save in current directory



