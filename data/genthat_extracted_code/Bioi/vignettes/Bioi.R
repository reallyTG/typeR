## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(Bioi)

# Generate two data sets to simulate 3D PALM data.
set.seed(10)

mOne <- as.matrix(data.frame(
  x = rnorm(10),
  y = rbinom(10, 100, 0.5),
  z = runif(10)
))

mTwo <- as.matrix(data.frame(
  x = rnorm(20),
  y = rbinom(20, 100, 0.5),
  z = runif(20)
))

# Get separation distances.
find_min_dists(mOne, mTwo)

## ------------------------------------------------------------------------
# Generate random data.
set.seed(10)
input <- as.matrix(data.frame(x=rnorm(10),y=rnorm(10)))

# Perform clustering.
groups <- euclidean_linker(input, 0.8)

print(groups)

## ----eval=FALSE----------------------------------------------------------
#  library(ggplot2)
#  input <- as.data.frame(input)
#  input$group <- as.character(groups)
#  ggplot(input, aes(x, y, colour = group)) + geom_point(size = 3)

## ------------------------------------------------------------------------
# Generate a random matrix.
set.seed(10)
mat <- matrix(runif(70), nrow = 7)

# Arbitrarily say that everything below 0.8 is background.
logical_mat <- mat > 0.8

# Row names and column names are preserved in the output of find_blobs
rownames(logical_mat) <- letters[1:7]
colnames(logical_mat) <- 1:10

# Find blobs
find_blobs(logical_mat)

