library(seriation)


### Name: bertinplot
### Title: Plot a Bertin Matrix
### Aliases: bertinplot bertin_cut_line panel.bars panel.circles
###   panel.squares panel.lines panel.blocks
### Keywords: hplot cluster

### ** Examples

data("Irish")
scale_by_rank <- function(x) apply(x, 2, rank)
x <- scale_by_rank(Irish[,-6])

## use the the sum of absolute rank differences
order <- c(
  seriate(dist(x, "minkowski", p = 1)),
  seriate(dist(t(x), "minkowski", p = 1))
)

## plot
bertinplot(x, order)

## some alternative displays
bertinplot(x, order, options = list(shading = TRUE, panel = panel.blocks))
bertinplot(x, order, options = list(panel = panel.lines))
bertinplot(x, order, options = list(panel = panel.squares))
bertinplot(x, order, 
    options = list(panel = panel.circles, spacing = -0.5))

## plot with cut lines (we manually set the order here)
order <- ser_permutation(c(21, 16, 19, 18, 14, 12, 20, 15, 
    17, 26, 13, 41,  7, 11, 5, 23, 28, 34, 31, 1, 38, 40,  
    3, 39,  4, 27, 24,  8, 37, 36, 25, 30, 33, 35,  2, 
    22, 32, 29, 10,  6,  9),
    c(4, 2, 1, 6, 8, 7, 5, 3))

bertinplot(x, order, options=list(pop=FALSE))
bertin_cut_line(,4) ## horizontal line between rows 4 and 5
bertin_cut_line(,7) ## separate "Right to Life" from the rest
bertin_cut_line(14,c(0,4)) ## separate a block of large values (vertically)



