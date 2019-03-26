library(hyperSpec)


### Name: aggregate
### Title: aggregate hyperSpec objects
### Aliases: aggregate aggregate,hyperSpec-method ave,hyperSpec-method
### Keywords: array category methods

### ** Examples

cluster.means <- aggregate (chondro, chondro$clusters, mean_pm_sd)
plot(cluster.means, stacked = ".aggregate", fill = ".aggregate",
     col = matlab.dark.palette (3))

## make some "spectra"
spc <- new ("hyperSpec", spc = sweep (matrix (rnorm (10*20), ncol = 20), 1, (1:10)*5, "+"))

## 3 groups
color <- c("red", "blue", "black")
by <- as.factor (c (1, 1, 1, 1, 1, 1, 5, 1, 2, 2))
by
plot (spc, "spc", col = color[by])

## Example 1: plot the mean of the groups 
plot (aggregate (spc, by, mean), "spc", col = color, add = TRUE,
      lines.args = list(lwd = 3, lty = 2))

## Example 2: FUN may return more than one value (here: 3)
plot (aggregate (spc, by, mean_pm_sd), "spc",
      col = rep(color, each = 3), lines.args = list(lwd = 3, lty = 2)) 

## Example 3: aggregate even takes FUN that return different numbers of
##            values for different groups 
plot (spc, "spc", col = color[by])

weird.function <- function (x){
   if (length (x) == 1)
      x + 1 : 10
   else if (length (x) == 2)
      NULL
   else
      x [1]
}

agg <- aggregate (spc, by, weird.function)
agg$.aggregate 
plot (agg, "spc",  add = TRUE, col = color[agg$.aggregate],
      lines.args = list (lwd = 3, lty = 2))




