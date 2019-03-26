library(RImageJROI)


### Name: plot.ijroi
### Title: Plot ijroi object
### Aliases: plot.ijroi

### ** Examples

# type 0 'polygon' ROIs are plotted using lines()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "polygon.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# type 1 'rect' ROIs are plotted using rect()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "rect.roi")
x <- read.ijroi(file)
plot(x, border = "red")

# type 2 'oval' ROIs are plotted using polygon()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "oval.roi")
x <- read.ijroi(file)
plot(x, border = "red")

# type 3 'line' ROIs (among others listed in 'details') are plotted using lines()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "line.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# type 3 arrows are a subtype of 'line'. Plotted using arrows(). The stroke width is
# carried over. To change width, use lwd argument
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "arrow.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# type 4 'freeline' ROIs are plotted using lines()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "freehand_line.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# type 5 'polyline' ROIs are plotted using lines()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "segmented_line.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# type 7 'freehand' selection ROIs are plotted using lines()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "freehand_selection.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# type 7 Objects created using 'Elliptical selections' tool are also saved as
# 'freehand', but with subtype 'ELLIPSE'. The coordinates for this type are flawed
# and plotting is done using equation for an ellipse
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "elliptical.roi")
x <- read.ijroi(file)
plot(x, border = "red")
lines(x$coords[,1], x$coords[,2]) ## plotted based on coordinates.

# type 10 'point' ROIs are plotted using points()
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "multi_point.roi")
x <- read.ijroi(file)
plot(x, col = "red")

# If following is shown as a (round) circle, asp = 1
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "circle.roi")
x <- read.ijroi(file)
plot(x, border = "red")

# text is stored as type 'rect' with subtype 'TEXT'. Currently
# only the outlining rectangle is returned
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "text.roi")
x <- read.ijroi(file)
plot(x, border = "red")



