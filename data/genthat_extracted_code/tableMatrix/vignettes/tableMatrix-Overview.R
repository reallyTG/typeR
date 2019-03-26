## ---- echo = FALSE-------------------------------------------------------
library(tableMatrix)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path='man/figures/README-'
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("tableMatrix")

## ----eval=FALSE----------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("InferenceTechnologies/tableMatrix")

## ------------------------------------------------------------------------
data(chickwts)
 
# Bundle chickwts data.frame together with a linear model
TL <- tableList(chickwts, lm(weight~feed, chickwts))

# tableList behaves like a data.table  
mean(TL[feed=="casein", weight])

# Aid part of the tableList object carries the linear model
aid(TL)

## ------------------------------------------------------------------------
# Load datasets
data(images8By8)
data(images10By10)

# Create a signle tableMatrix object from both datasets
# First 3 columns used as meta data, the rest as main data with corresponding dimensions
TM <- tableMatrix(list(images8By8, images10By10),
list(1:3, 1:3), list(c(4:ncol(images8By8)),c(4:ncol(images10By10))), list(c(8,8), c(10,10)))

# Default print displays the table (meta data) part
TM

# Number of matrices stored in the matrix (main data) part
length(mat(TM))

# Dimensions of the matrix part
matDim(TM)

# Aid part is empty
aid(TM)


# Image data for first row
img <- getRow(TM, 1)

# Restoring dimensions of the image
dim(img) <- getRowDim(TM, 1)

# Visualising the image
image(img, axes=F)

## ------------------------------------------------------------------------
# Subsetting via bracket passed to the table (meta data) part
# We choose first matrix type, down direction
TM1down <- TM[.(1)][direction=="down"]

# One matrix in the matrix part of TM1down
length(mat(TM1down))

# One dimension row
matDim(TM1down)

# Heatmap
imgHeat <- colMeans(mat(TM1down, 1))

# Restoring dimensions of the heatmap
dim(imgHeat) <- getRowDim(TM1down, 1)

# Visualising heatmap
image(imgHeat, axes=F)

