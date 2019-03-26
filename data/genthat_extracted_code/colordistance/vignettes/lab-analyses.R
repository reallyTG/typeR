## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Get a list of all the images in the examples folder
image_folders <- dir(system.file("extdata/Heliconius", package = "colordistance"), full.names = T)
image_paths <- sapply(image_folders, colordistance::getImagePaths)
dim(image_paths) <- NULL

# Read in the first image with CIELab pixels
H1 <- colordistance::loadImage(image_paths[1], lower = rep(0.8, 3), upper = rep(1, 3),
                         CIELab = TRUE, ref.white = "D65", sample.size = 10000)

## ------------------------------------------------------------------------
head(H1$filtered.lab.2d)

## ---- fig.width = 4, fig.height = 4, fig.align="center"------------------
colordistance::plotPixels(H1, lower = rep(0.8, 3), upper = rep(1, 1), 
                          color.space = "lab", ref.white = "D65", 
                          main = "CIELab color space",
                          ylim = c(-100, 100), zlim = c(0, 100))

## ---- fig.width = 6, fig.height = 3, fig.align="center"------------------
par(mfrow = c(1, 2))
# Setting boundaries
lab_hist <- colordistance::getLabHist(image_paths[1], bins = 3, 
                                      sample.size = 10000, ref.white = "D65", bin.avg = TRUE, 
                                      plotting = TRUE, lower = rep(0.8, 3), upper = rep(1, 3),
                                      a.bounds = c(-100, 100), b.bounds = c(-100, 100))
# Leaving default boundaries (minor difference)
lab_hist <- colordistance::getLabHist(image_paths[1], bins = 3, 
                                      sample.size = 10000, ref.white = "D65", bin.avg = TRUE, 
                                      plotting = TRUE, lower = rep(0.8, 3), upper = rep(1, 3))


## ---- fig.width = 4, fig.height = 3, fig.align="center"------------------
lab_kmeans <- colordistance::getKMeanColors(image_paths[1], n = 2, sample.size = 10000,
                                            lower = rep(0.8, 3), upper = rep(1, 3), 
                                            color.space = "CIELab", ref.white = "D65")

## ---- fig.width=7, fig.height=4, fig.align="center"----------------------
# Generate clusters
par(mfrow = c(2, 4))
lab_hist_list <- colordistance::getLabHistList(image_paths, bins = 2, sample.size = 10000,
                                ref.white = "D65", lower = rep(0.8, 3), upper = rep(1, 3),
                                plotting = TRUE, pausing = FALSE)

## ---- fig.width = 7, fig.height = 5, fig.align="center"------------------
# Get distance matrix
par(mfrow = c(1,1))
lab_dist_matrix <- colordistance::getColorDistanceMatrix(lab_hist_list, plotting = TRUE)


