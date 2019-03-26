## ---- echo=FALSE, fig.width=4, fig.height=4------------------------------
require(scatterplot3d)

rgb.pixels <- cbind(runif(100000), runif(100000), runif(100000))
scatterplot3d::scatterplot3d(rgb.pixels, color=rgb(rgb.pixels), pch = 20,
                             xlab="Red", ylab="Green", zlab="Blue")
scatterplot3d::scatterplot3d(rgb.pixels, color=rgb(rgb.pixels), pch = 20,
                             xlab="Red", ylab="Green", zlab="Blue", angle=-45)

## ---- echo=FALSE, fig.align='center'-------------------------------------
require(scatterplot3d)

lower <- c(0.7, 0.01, 0.7)
upper <- c(0.99, 0.3, 0.99)

idx <- which( (lower[1] <= rgb.pixels[ , 1] &
                 rgb.pixels[ , 1] <= upper[1]) &
                (lower[2] <= rgb.pixels[ , 2] &
                   rgb.pixels[ , 2] <= upper[2]) &
                (lower[3] <= rgb.pixels[ , 3] &
                   rgb.pixels[ , 3] <= upper[3]))

rectangle <- rgb.pixels[idx, ]
scatterplot3d::scatterplot3d(rectangle, color=rgb(rectangle),
      xlim=c(0, 1), ylim=c(0, 1), zlim=c(0, 1), 
      xlab="Red", ylab="Green", zlab="Blue", pch=20)



## ---- echo=FALSE, fig.align='center'-------------------------------------
require(scatterplot3d)

center <- c(0.4, 0.7, 0.4)
radius <- 0.05
distances <- vector(length = nrow(rgb.pixels))

for (i in 1:nrow(rgb.pixels)) {
  distances[i] <- sqrt(sum((rgb.pixels[i, ] - center)^2))
}

idx <- which(distances <= radius)

scatterplot3d::scatterplot3d(rgb.pixels[idx, ],
                             color=rgb(rgb.pixels[idx, ]),
                             xlim=c(0, 1), ylim=c(0, 1), zlim=c(0, 1), 
                             xlab="Red", ylab="Green", zlab="Blue", pch=20)


## ---- echo=FALSE, fig.align='center'-------------------------------------
require(scatterplot3d)

radius <- 0.25

idx <- which(distances <= radius)

scatterplot3d::scatterplot3d(rgb.pixels[idx, ],
                             color=rgb(rgb.pixels[idx, ]),
                             xlim=c(0, 1), ylim=c(0, 1), zlim=c(0, 1), 
                             xlab="Red", ylab="Green", zlab="Blue", pch=20)


## ---- echo=FALSE, fig.width=4, fig.height=4.5, fig.align="center"--------
require(scatterplot3d)
img <- jpeg::readJPEG("norway.jpg")
countcolors::plotArrayAsImage(img)


## ---- fig.width=7, fig.height=7, fig.align="center"----------------------

# Note we're using the `plotPixels` function from the related colordistance
# package
colordistance::plotPixels("norway.jpg", lower = NULL, upper = NULL, n = 5000)


## ---- fig.width=6, fig.height=6, fig.align="center", results=F, eval=F----
#  # Find K-means clusters
#  kmeans.clusters <- colordistance::getKMeanColors("norway.jpg", n = 3, plotting = FALSE)
#  colordistance::extractClusters(kmeans.clusters)
#  

## ------------------------------------------------------------------------

center.spherical <- c(0.24, 0.45, 0.24) # Center color for spherical range

lower.rectangular <- c(0.2, 0.35, 0.2) # Lower limit for each of the three color channels
upper.rectangular <- c(0.3, 0.55, 0.3) # Upper limit for each of the three color channels


## ------------------------------------------------------------------------

# Read the image into the R environment
norway <- jpeg::readJPEG("norway.jpg")

# Find all the pixels within a 10% radius
norway.spherical <- countcolors::sphericalRange(norway, center = center.spherical, radius = 0.1, color.pixels = FALSE, plotting = FALSE); names(norway.spherical)

norway.spherical$img.fraction


## ---- fig.align='center'-------------------------------------------------

countcolors::changePixelColor(norway, norway.spherical$pixel.idx, target.color="magenta")


## ---- fig.align='center'-------------------------------------------------

# Find all the pixels within a 17% radius
norway.spherical <- countcolors::sphericalRange(norway, 
                    center = center.spherical, radius = 0.15, 
                    color.pixels = FALSE, plotting = TRUE, 
                    target.color = "magenta"); norway.spherical$img.fraction


## ---- fig.align='center'-------------------------------------------------
# Trying with our original color ranges
norway.rectangular <- countcolors::rectangularRange(norway, 
                      upper = upper.rectangular, lower = lower.rectangular, 
                      target.color = "yellow")

# Trying with our cooking show values
norway.rectangular <- countcolors::rectangularRange(norway, 
                      upper = c(0.55, 0.75, 0.4), lower = c(0.1, 0.25, 0), 
                      target.color = "yellow"); norway.rectangular$img.fraction


## ---- fig.align='center'-------------------------------------------------
# Using multiple colors
green.center <- c(0.24, 0.45, 0.24)
white.center <- c(1, 1, 1)

two.colors <- countcolors::countColors("norway.jpg", color.range="spherical", 
                                       center = c(green.center, white.center), radius = c(0.15, 0.1),
                                       bg.lower=NULL, bg.upper=NULL, plotting = TRUE,
                                       target.color=c("magenta", "cyan"))

# Note that the fraction of all colors COMBINED is provided - to get them
# separately, call the function multiple times
two.colors$pixel.fraction


## ---- fig.align='center'-------------------------------------------------
# Using multiple colors
green.center <- c(0.24, 0.45, 0.24)
bg.upper <- c(0.2, 0.2, 0.45)
bg.lower <- c(0, 0, 0)

bg.ignore <- countcolors::countColors("norway.jpg", color.range="spherical", 
                                       center = green.center, radius = 0.15,
                                       bg.lower=bg.lower, bg.upper=bg.upper, plotting = TRUE)

# Nearly 60%, as opposed to 26%, because we're no longer counting the water
bg.ignore$pixel.fraction


