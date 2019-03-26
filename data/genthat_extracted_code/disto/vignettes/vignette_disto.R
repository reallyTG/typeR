## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
  , comment = "#>"
)

## ------------------------------------------------------------------------
library("disto")

# create a dist object
do <- dist(mtcars)

# create a disto connection (does not nake a copy of do)
dio <- disto(objectname = "do")

# what's dio
dio

# what does it actually contain
unclass(dio)

# summary of the distance object underneath
summary(dio)

# what is the size?
size(dio)

# what are the names?
names(dio)

# convert to a dataframe
# caveat: costly for large distance matrices
head(as.data.frame(dio))

# quick plots
plot(dio, type = "dendrogram")
plot(dio, type = "heatmap")

## ------------------------------------------------------------------------
# what is the distance between 1st and 2nd element
# note that this returns a matrix
dio[1, 2]

# this should be same as above, except the matrix is transposed
dio[2, 1]

# extract using names/labels
dio["Mazda RX4 Wag", "Mazda RX4"]

# for a single value extraction, `[[` is efficient as it does less work
dio[[3, 4]] 
# dio[["Mazda RX4 Wag", "Mazda RX4"]] wont work, only integer index is supported in `[[`
# neither would dio[[c(1, 2), 3]]

# extract
dio[1:5, 9:12]

# extract mixed
dio[1:5, c("Merc 240D", "Merc 230")]

# exclude i or j
dim(dio[1:2, ])
dim(dio[, 1:2])
dim(dio[,])

# All examples worked in outer product way
# Specify product type as inner to extract diagonals only
dio[1:5, 9:12, product = "inner"]

# use lower triangular indexing
dio[k = 1] # same as dio[1, 2]
dio[k = 1:5]

## ------------------------------------------------------------------------
# replace a value
dio[1, 2] <- 100

# did it replace?
dio[1, 2]

# did it really replace at source
do[1] # yes, it did

# replacement is vectorized in inner product sense
dio[1:5, 2:6] <- 7:11
dio[1:5, 2:6, product = "inner"]

## ------------------------------------------------------------------------
# lets find indexes of five nearest neighbors for each observation/item

# function to pick indexes of 5 nearest neighbors
# an efficient alternative (with Rcpp) might be better
udf <- function(x) order(x)[2:6]

hi <- dapply(dio, 1, udf)
dim(hi)
hi[1:5, 1:5]

## ------------------------------------------------------------------------
dist_extract(do, 1:5, 2:7)
do <- dist_replace(do, 1:3, 4:6, 101:103)
dist_extract(do, 1:3, 4:6, product = "inner")

