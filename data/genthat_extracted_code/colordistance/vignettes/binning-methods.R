## ---- echo=F-------------------------------------------------------------
knitr::opts_chunk$set(
  fig.align="center"
)

## ---- out.width="400px", echo=FALSE--------------------------------------
knitr::include_graphics(system.file("extdata", "Heliconius/Heliconius_B/Heliconius_08.jpeg", package = "colordistance"))

## ---- fig.width=5, fig.height=4, fig.cap="(See the introduction for more information on the `plotPixels()` function.)"----
# Note: any valid filepath will work; this line is specific to 
# example data that comes with the package
Heliconius_08 <- system.file("extdata", "Heliconius/Heliconius_B/Heliconius_08.jpeg", package="colordistance")
colordistance::plotPixels(Heliconius_08, lower = rep(0.8, 3), upper = rep(1, 3))

## ---- fig.cap="(For more information in `getImageHist()`, see the 'Histogram method' section.)"----
binnedButterfly <- colordistance::getImageHist(Heliconius_08, bins = 2, lower = rep(0.8, 3), upper = rep(1, 3), plotting = TRUE)

## ---- fig.width=7, fig.height=6------------------------------------------
par(mfrow=c(2,2))

# Generate histogram using all the default settings (3 bins per channel, get average pixel color in each bin, use RGB instead of HSV)
# See introduction vignette or documentation if lower/upper background pixel arguments are unclear
# Short version: getting rid of any pixels where R, G, and B values are ALL between 0.8 and 1 (aka white)
lower <- rep(0.8, 3)
upper <- rep(1, 3)
defaultHist <- colordistance::getImageHist(Heliconius_08, lower = lower, upper = upper, title = "3 bins per channel, RGB")

# We already did 8 bins above, so let's do 1 bin just for sarcasm
oneBin <- colordistance::getImageHist(Heliconius_08, lower = lower, upper = upper, bins = 1, title="1 bin (pointless but didactic?)")

# Use 2 red and green bins, but only 1 blue bin
unevenBins <- colordistance::getImageHist(Heliconius_08, lower = lower, upper = upper, bins = c(2, 2, 1), title = "Non-uniform channel divisions")

# HSV instead of RGB
hsvBins <- colordistance::getImageHist(Heliconius_08, lower = lower, upper = upper, hsv = TRUE, title = "HSV, not RGB")

## ------------------------------------------------------------------------
defaultHist[1:10, ]

## ---- results=F----------------------------------------------------------
images <- dir(system.file("extdata", "Heliconius/", package = "colordistance"), full.names = TRUE)
histList <- colordistance::getHistList(images, bins = 2, plotting = FALSE)

## ------------------------------------------------------------------------
# Output of getHistList() is (you guessed it) a list of dataframes as returned by getImageHist()
histList[[1]]

# and list elements are named for the image they came from
names(histList)

## ---- fig.width=4, fig.height=5------------------------------------------
lower <- rep(0.8, 3)
upper <- rep(1, 3)
kmeans01 <- colordistance::getKMeanColors(Heliconius_08, lower = lower, upper = upper, n = 3)

## ------------------------------------------------------------------------
# Using default sample size
system.time(colordistance::getKMeanColors(Heliconius_08, lower = lower, upper = upper, n = 3, plotting = FALSE))

# Using 10,000 instead of 20,000 pixels is slightly faster, but not by much
system.time(colordistance::getKMeanColors(Heliconius_08, lower = lower, upper = upper, n = 3, plotting = FALSE, sample.size = 10000))

# Using all pixels instead of sample takes 5x longer - and this is a very low-res image!
system.time(colordistance::getKMeanColors(Heliconius_08, lower = lower, upper = upper, n = 3, plotting = FALSE, sample.size = FALSE))

## ------------------------------------------------------------------------
kmeansDF <- colordistance::extractClusters(kmeans01)
print(kmeansDF)

## ---- results=F----------------------------------------------------------
# In order to see the clusters for each image, set plotting to TRUE and optionally pausing to TRUE as well
kmeans02 <- colordistance::getKMeansList(images, bins = 3, lower = lower, upper = upper, plotting = F)

## ------------------------------------------------------------------------
kmeansClusters <- colordistance::extractClusters(kmeans02, ordering = T)
head(kmeansClusters, 3)

## ---- fig.width=4, fig.height=5------------------------------------------
colordistance::getKMeanColors(Heliconius_08, lower = lower, upper = upper, return.clust = FALSE)

## ---- fig.width=6, fig.height=3------------------------------------------
par(mfrow=c(1, 3))
# Get and plot histogram for a single image
hist01 <- colordistance::getImageHist(Heliconius_08, bins = 2, plotting = TRUE, title = "RGB, 2 bins per channel", lower = lower, upper = upper)

# Use the bin center as the cluster value instead of the average pixel location (note the difference between this and when bin.avg=F)
hist02 <- colordistance::getImageHist(Heliconius_08, bins = 2, plotting = TRUE, title = "bin.avg = F", lower = lower, upper = upper, bin.avg = FALSE)

# Use different number of bins for each channel; use HSV instead of RGB
hist03 <- colordistance::getImageHist(Heliconius_08, bins=c(8, 1, 2), plotting=TRUE, hsv=TRUE, title="HSV, 8 hue, 1 sat, 2 val", lower=lower, upper=upper)

## ---- results=F, eval=F--------------------------------------------------
#  # Get histograms for a set of images
#  histMulti <- colordistance::getHistList(images, bins=2, plotting=FALSE, lower=lower, upper=upper)

## ---- fig.width=4, fig.height=5, eval=F----------------------------------
#  lower <- rep(0.8, 3)
#  upper <- rep(1, 3)
#  
#  # Use defaults
#  kmeans01 <- colordistance::getKMeanColors(Heliconius_08, n=3, plotting=FALSE, lower=lower, upper=upper)
#  kmeansDF <- colordistance::extractClusters(kmeans01)
#  
#  # Use a larger sample size
#  kmeans02 <- colordistance::getKMeanColors(Heliconius_08, n=3, plotting=FALSE, sample.size = 30000, lower=lower, upper=upper)
#  kmeansDF2 <- colordistance::extractClusters(kmeans02)
#  
#  # Don't return clusters as a dataframe
#  colordistance::getKMeanColors(Heliconius_08, n=15, plotting=FALSE, return.clustlust=FALSE, lower=lower, upper=upper)

## ---- results=F, eval=F--------------------------------------------------
#  # For whole dataset
#  kmeans03 <- colordistance::getKMeansList(images, n=3, plotting=FALSE, lower=lower, upper=upper)
#  kmeansList <- colordistance::extractClusters(kmeans03)

## ---- results=F, eval=F--------------------------------------------------
#  # If we use the same number of clusters for both the histogram and k-means methods, how different do the clusters look?
#  # Not run in this vignette, but produces 3D, interactive plots!
#  histExample <- colordistance::getHistList(images, lower = lower, upper = upper)
#  
#  kmeansExample <- colordistance::extractClusters(colordistance::getKMeansList(images, bins = 27, lower = lower, upper = upper))
#  
#  colordistance::plotClustersMulti(histExample, title = "Histogram method")
#  
#  colordistance::plotClustersMulti(kmeansExample, title = "K-means method")

