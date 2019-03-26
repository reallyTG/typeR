## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ">"
)
library("TDAstats")

## ----install-package, eval = FALSE---------------------------------------
#  # install development version of TDAstats - advanced users
#  devtools::install_github("rrrlw/TDAstats")
#  
#  # install TDAstats from CRAN
#  install.packages("TDAstats")
#  
#  # load TDAstats for use
#  library("TDAstats")

## ----load-data-----------------------------------------------------------
# load dataset
data(circle2d)

# look at the dimensions and class of circle2d
class(circle2d)
nrow(circle2d)
ncol(circle2d)

# take a peek at first 6 rows
head(circle2d)

## ----plot-circle2d, fig.width = 4, fig.height = 4.5----------------------
# scatterplot of circle2d
plot(circle2d, xlab = "x", ylab = "y", main = "Point cloud in circle2d dataset")

## ----calc-hom------------------------------------------------------------
# calculate persistent homology
circle.phom <- calculate_homology(circle2d)

# print first 6 features (ordered by dimension and birth)
head(circle.phom)

# print last 6 features (ordered by dimension and birth)
tail(circle.phom)

## ----plot-barcode, fig.height = 4.5, fig.width = 6-----------------------
# plot topological barcode
plot_barcode(circle.phom)

## ----plot-persist, fig.height = 4.5, fig.width = 6-----------------------
# plot persistence diagram
plot_persist(circle.phom)

