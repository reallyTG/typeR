## ----setup, include = FALSE, echo=FALSE----------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(tabula)

## ----create--------------------------------------------------------------
# Create a count data matrix
CountMatrix(data = sample(0:10, 100, TRUE),
            nrow = 10, ncol = 10)

# Create an incidence (presence/absence) matrix
# Numeric values are coerced to logical as by as.logical
IncidenceMatrix(data = sample(0:1, 100, TRUE),
                nrow = 10, ncol = 10)

## ----coerce--------------------------------------------------------------
# Create a count matrix
#  Numeric values are coerced to integer and hence truncated towards zero
A1 <- CountMatrix(data = sample(0:10, 100, TRUE),
                  nrow = 10, ncol = 10)

# Coerce counts to frequencies
B <- as(A1, "FrequencyMatrix")

# Row sums are internally stored before coercing to a frequency matrix
totals(B)
# This allows to restore the source data
A2 <- as(B, "CountMatrix")
all(A1 == A2)

# Coerce to presence/absence
C <- as(A1, "IncidenceMatrix")

# Coerce to a co-occurrence matrix
D <- as(A1, "OccurrenceMatrix")

## ----plot-freq, fig.width=4, fig.height=6, fig.align="center"------------
# Plot frequencies with the column means as a threshold
mississippi_counts <- as(mississippi, "CountMatrix")

plotSpot(mississippi_counts, threshold = mean) +
  ggplot2::labs(size = "Frequency", colour = "Mean") +
  khroma::scale_colour_vibrant()

## ----plot-occ, fig.width=6, fig.height=4, fig.align="center"-------------
# Plot co-occurence of types
# (i.e. how many times (percent) each pairs of taxa occur together 
# in at least one sample.)
mississippi_occ <- as(mississippi, "OccurrenceMatrix")
plotSpot(mississippi_occ) +
  ggplot2::labs(size = "", colour = "Co-occurrence") +
  ggplot2::theme(legend.box = "horizontal") +
  khroma::scale_colour_YlOrBr()

## ----plot-matrix, fig.width=7, fig.height=3.5, fig.align="center"--------
# Reproduce B. Desachy's matrigraphe
boves_counts <- as(boves, "CountMatrix")

plotMatrix(boves_counts) +
  ggplot2::theme_light() +
  khroma::scale_fill_YlOrBr()

## ----plot-matrigraphe, fig.width=7, fig.height=3.5, fig.align="center"----
# Reproduce B. Desachy's matrigraphe
plotMatrix(boves_counts, PVI = TRUE) +
  ggplot2::scale_fill_gradient2(midpoint = 1) +
  ggplot2::theme_bw()

## ----plot-bertin, fig.width=7, fig.height=7, fig.align="center"----------
plotBar(boves_counts, center = FALSE, horizontal = FALSE) +
  ggplot2::labs(title = "Ford diagram") +
  ggplot2::theme_bw()

## ----plot-ford, fig.width=7, fig.height=3.5, fig.align="center"----------
plotBar(boves_counts, center = TRUE, horizontal = FALSE) +
  ggplot2::labs(title = "Bertin diagram") +
  ggplot2::theme_light()

## ----plot-seriographe, fig.width=7, fig.height=3.5, fig.align="center"----
# Reproduce B. Desachy's sériographe
plotBar(boves_counts, EPPM = TRUE) +
  khroma::scale_fill_bright()

## ----ranking, fig.show='hold'--------------------------------------------
# Build an incidence matrix with random data
set.seed(12345)
incidence1 <- IncidenceMatrix(data = sample(0:1, 400, TRUE, c(0.6, 0.4)),
                              nrow = 20)

# Get seriation order on rows and columns
# If no convergence is reached before the maximum number of iterations (100), 
# it stops with a warning.
(indices <- seriate(incidence1, method = "reciprocal", margin = c(1, 2),
                    stop = 100))

# Permute matrix rows and columns
incidence2 <- permute(incidence1, indices)

# Plot matrix
plotMatrix(incidence1) + 
  ggplot2::labs(title = "Original matrix") +
  ggplot2::theme(legend.position = "bottom") +
  ggplot2::scale_fill_manual(values = c("TRUE" = "black", "FALSE" = "white"))
plotMatrix(incidence2) + 
  ggplot2::labs(title = "Rearranged matrix") +
  ggplot2::theme(legend.position = "bottom") +
  ggplot2::scale_fill_manual(values = c("TRUE" = "black", "FALSE" = "white"))

## ----averaging, fig.width=7, fig.height=5, fig.show='hold'---------------
# Reproduces Desachy 2004 results

## Coerce dataset to an abundance matrix
compiegne_counts <- as(compiegne, "CountMatrix")

## Plot original data matrix
plotBar(compiegne_counts, EPPM = TRUE) +
  ggplot2::labs(title = "Original dataset") + 
  ggplot2::theme_bw() + 
  ggplot2::theme(panel.spacing = ggplot2::unit(0, "lines"),
                 panel.border = ggplot2::element_rect(colour = NA),
                 legend.position = "bottom")

## Get seriation order for columns on EPPM using the reciprocal averaging method
## Expected column order: N, A, C, K, P, L, B, E, I, M, D, G, O, J, F, H
compiegne_indices <- seriate(compiegne_counts, method = "reciprocal", 
                             EPPM = TRUE, margin = 2)

## Permute columns
compiegne_seriation <- permute(compiegne_counts, compiegne_indices)

## Plot new matrix
plotBar(compiegne_seriation, EPPM = TRUE) +
  ggplot2::labs(title = "Reordered dataset") + 
  ggplot2::theme_bw() + 
  ggplot2::theme(panel.spacing = ggplot2::unit(0, "lines"),
                 panel.border = ggplot2::element_rect(colour = NA),
                 legend.position = "bottom")

## ----ca------------------------------------------------------------------
## Coerce dataset to an abundance matrix
zuni_counts <- as(zuni, "CountMatrix")

# Correspondance analysis of the whole dataset
ca <- FactoMineR::CA(zuni_counts, graph = FALSE)

# Plot CA results
ggplot2::ggplot(mapping = ggplot2::aes(x = `Dim 1`, y = `Dim 2`)) +
  ggplot2::geom_vline(xintercept = 0, linetype = 2) +
  ggplot2::geom_hline(yintercept = 0, linetype = 2) +
  ggplot2::geom_point(data = as.data.frame(ca$row$coord), color = "black") +
  ggplot2::geom_point(data = as.data.frame(ca$col$coord), color = "red") +
  ggplot2::coord_fixed() + 
  ggplot2::theme_bw()

## ----ca-seriation, fig.width=7, fig.height=7-----------------------------
# Get row permutations from CA coordinates
zuni_indices <- seriate(zuni_counts, method = "correspondance", margin = 1)

# Permute data matrix
zuni_seriation <- permute(zuni_counts, zuni_indices)

# Plot Ford diagram
# Warning: this may take a few seconds!
plotBar(zuni_seriation, level = FALSE) +
  ggplot2:: theme(axis.text = ggplot2::element_blank(),
                  axis.ticks = ggplot2::element_blank(),
                  axis.title = ggplot2::element_blank())

## ----refine, fig.show='hold'---------------------------------------------
# Reproduces Peeples and Schachner 2012 results

## Samples with convex hull maximum dimension length greater than the cutoff
## value will be marked for removal.
## Define cutoff as one standard deviation above the mean
fun <- function(x) { mean(x) + sd(x) }

## Get indices of samples to be kept
## Warning: this may take a few seconds!
set.seed(123)
zuni_keep <- refine(zuni_counts, cutoff = fun, n = 1000)

## Plot convex hull
## blue: convex hull for samples; red: convex hull for types
### All bootstrap samples
ggplot2::ggplot(mapping = ggplot2::aes(x = x, y = y, group = id)) +
  ggplot2::geom_vline(xintercept = 0, linetype = 2) +
  ggplot2::geom_hline(yintercept = 0, linetype = 2) +
  ggplot2::geom_polygon(data = zuni_keep[["rows"]], 
                        fill = "blue", alpha = 0.05) +
  ggplot2::geom_polygon(data = zuni_keep[["columns"]], 
                        fill = "red", alpha = 0.5) +
  ggplot2::coord_fixed() + 
  ggplot2::theme_bw() + 
  ggplot2::labs(title = "Whole dataset", x = "Dim. 1", y = "Dim. 2")
### Only retained samples
ggplot2::ggplot(mapping = ggplot2::aes(x = x, y = y, group = id)) +
  ggplot2::geom_vline(xintercept = 0, linetype = 2) +
  ggplot2::geom_hline(yintercept = 0, linetype = 2) +
  ggplot2::geom_polygon(data = subset(zuni_keep[["rows"]], 
                                      id %in% names(zuni_keep[["keep"]])),
                        fill = "blue", alpha = 0.05) +
  ggplot2::geom_polygon(data = zuni_keep[["columns"]], 
                        fill = "red", alpha = 0.5) +
  ggplot2::coord_fixed() + 
  ggplot2::theme_bw() + 
  ggplot2::labs(title = "Selected samples", x = "Dim. 1", y = "Dim. 2")

## ----refine-ca-----------------------------------------------------------
## Get CA-based seriation order
(zuni_refined <- seriate(zuni_counts, zuni_keep, margin = 1))

## ----date, fig.width=5, fig.height=3.5, fig.show='hold', fig.align="center"----
# Coerce dataset to abundance (count) matrix
zuni <- as(zuni, "CountMatrix")

# Assume that some assemblages are reliably dated (this is NOT a real example).
# The names of the vector entries must match the names of the assemblages.
dates <- list(
  LZ0569 = 1097, LZ0279 = 1119, CS16 = 1328, LZ0066 = 1111,
  LZ0852 = 1216, LZ1209 = 1251, CS144 = 1262, LZ0563 = 1206,
  LZ0329 = 1076, LZ0005Q = 859, LZ0322 = 1109, LZ0067 = 863,
  LZ0578 = 1180, LZ0227 = 1104, LZ0610 = 1074
)

# Model the event and accumulation date for each assemblage.
(model <- dateEvent(zuni, dates, cutoff = 90))

## ----plot-date, fig.width=7, fig.height=3.5, fig.align="center"----------
# Plot event (line) and accumulation (grey area) date distributions
plotDate(model, select = "LZ1105") +
  ggplot2::theme_bw()

## ----refine-date---------------------------------------------------------
# Check model variability
checked <- dateEvent(zuni, dates, cutoff = 90,
                     jackknife = TRUE, bootstrap = TRUE, n = 1000)

# Extract results for the first 5 assemblages
## Modeled event dates
checked["rows", 1:5]
## Jackknife fabrics
checked["jackknife", 1:5]
## Bootstrap of assemblages
checked["bootstrap", 1:5]

## ----diversity-----------------------------------------------------------
H <- diversity(
  mississippi_counts, 
  method = c("shannon", "brillouin", "simpson", "mcintosh", "berger"), 
  simplify = TRUE
)

head(H)

## ----evenness------------------------------------------------------------
E <- evenness(
  mississippi_counts,
  method = c("brillouin", "mcintosh", "shannon", "simpson"),
  simplify = TRUE
)

head(E)

## ----similarity, fig.width=6, fig.height=5, fig.align="center"-----------
# Brainerd-Robinson index
S <- similarity(mississippi_counts, method = "brainerd")

# Plot the similarity matrix
plotSpot(S) +
  ggplot2::labs(size = "Similarity", colour = "Similarity") +
  khroma::scale_colour_YlOrBr()

## ----plot-rank, fig.width=7, fig.height=3.5, fig.align="center"----------
plotRank(compiegne_counts, log = "xy") +
  ggplot2::theme_bw()

