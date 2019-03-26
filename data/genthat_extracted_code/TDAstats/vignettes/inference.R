## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ">"
)

## ----seed----------------------------------------------------------------
# ensure reproducible results
set.seed(1)

# load TDAstats
library("TDAstats")

# load relevant datasets for case study
data("unif2d")
data("circle2d")

## ----unif2d-plot, fig.width = 4, fig.height = 4.5------------------------
# see if points in unif2d are actually distributed
# within a unit square as described above
plot(unif2d, xlab = "x", ylab = "y",
     main = "Points in unif2d")

## ----circ2d-plot, fig.width = 4, fig.height = 4.5------------------------
# see if points in circle2d are actually distributed
# on the circumference of a unit circle as described
plot(circle2d, xlab = "x", ylab = "y",
     main = "Points in circle2d")

## ----barcodes, fig.show = "hold", fig.height = 3, fig.width = 3.4--------
# calculate homologies for both datasets
unif.phom <- calculate_homology(unif2d, dim = 1)
circ.phom <- calculate_homology(circle2d, dim = 1)

# plot topological barcodes for both datasets
plot_barcode(unif.phom)
plot_barcode(circ.phom)

## ----fix-barcodes, fig.show = "hold", fig.height = 3, fig.width = 3.4----
# load ggplot2
library("ggplot2")

# plot barcodes with labels and identical axes
plot_barcode(unif.phom) +
  ggtitle("Persistent Homology for unif2d") +
  xlim(c(0, 2))
plot_barcode(circ.phom) +
  ggtitle("Persistent Homology for circle2d") +
  xlim(c(0, 2))

## ----permtest------------------------------------------------------------
# run permutation test
perm.test <- permutation_test(unif2d, circle2d, iterations = 100)

# display p-value for 0-cycles
print(perm.test[[1]]$pvalue)

# display p-value for 1-cycles
print(perm.test[[2]]$pvalue)

## ----permdist, fig.width = 5, fig.height = 4-----------------------------
# plot null distribution for 0-cycles as histogram
# and add vertical line at Wasserstein distance
# for original groups
hist(perm.test[[1]]$permvals,
     xlab = "Wasserstein distance",
     ylab = "Counts",
     main = "Null distribution for 0-cycles",
     xlim = c(0, 2.5))
abline(v = perm.test[[1]]$wasserstein)

# plot null distribution for 1-cycles as histogram
# and add vertical line at Wasserstein distance
# for original groups
hist(perm.test[[2]]$permvals,
     xlab = "Wasserstein distance",
     ylab = "Counts",
     main = "Null distribution for 1-cycles",
     xlim = c(0, 2))
abline(v = perm.test[[2]]$wasserstein)

