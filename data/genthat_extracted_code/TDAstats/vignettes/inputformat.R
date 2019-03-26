## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ">"
)

## ----load----------------------------------------------------------------
# load TDAstats
library("TDAstats")

# load unif2d dataset
data("unif2d")

## ----calcpc, fig.height = 4.5, fig.width = 6-----------------------------
# calculate persistent homology
data.phom <- calculate_homology(unif2d)

# visualize persistent homology
plot_barcode(data.phom)

## ----calcdist------------------------------------------------------------
# calculates the distance between two points
calc.dist <- function(point1, point2) {
  sqrt(sum((point1 - point2) ^ 2))
}

# calculates a distance matrix for a point cloud
calc.distmat <- function(point.cloud) {
  # create empty matrix
  ans.mat <- matrix(NA, nrow = nrow(point.cloud), ncol = nrow(point.cloud))
  
  # populate matrix
  for (i in 1:nrow(point.cloud)) {
    for (j in 1:nrow(point.cloud)) {
      ans.mat[i, j] <- calc.dist(point.cloud[i, ], point.cloud[j, ])
    }
  }
  
  # return distance matrix
  return(ans.mat)
}

## ----calcdistmat, fig.height = 4.5, fig.width = 6------------------------
# calculate distance matrix for unif2d
dist.unif2d <- calc.distmat(unif2d)

# calculate persistent homology using distance matrix
dist.phom <- calculate_homology(dist.unif2d, format = "distmat")

# visualize persistent homology
plot_barcode(dist.phom)

## ----plotcmp, fig.height = 2.6, fig.width = 3.4, fig.show = "hold"-------
# plot barcode for point cloud
plot_barcode(data.phom)

# plot barcode for distance matrix
plot_barcode(dist.phom)

## ----checkidentical------------------------------------------------------
identical(data.phom, dist.phom)

