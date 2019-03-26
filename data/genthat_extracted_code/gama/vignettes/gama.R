## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.align = "center", 
               out.width="100%",
               out.height="100%",
               fig.width = 4, fig.height = 4,
               dev.args=list(pointsize=7),
               par = TRUE, # needed for setting hook 
               collapse = TRUE, # collapse input & ouput code in chunks
               warning = FALSE)


knit_hooks$set(par = function(before, options, envir)
  { if(before && options$fig.show != "none")
       par(family = "sans", mar=c(4.1,4.1,1.1,1.1), mgp=c(3,1,0), tcl=-0.5)
})

## ---- message = FALSE, echo=TRUE-----------------------------------------
library(gama)

## ---- message = FALSE, echo=FALSE----------------------------------------
par(mfrow=c(1,2), pin=c(1.4, 1.6), font = 1)
components <-prcomp(cpu.als)
plot(components$x[,1], components$x[,2], pch = 20, xlab = "pc1", ylab = "pc2", main = "cpu.als")
components <-prcomp(cpu.pca)
plot(components$x[,1], components$x[,2], pch = 20, xlab = "pc1", ylab = "pc2", main = "cpu.pca")

## ---- message = FALSE, echo=FALSE----------------------------------------
par(mfrow=c(2,2), pin=c(1.2,1.2), font = 1) 
plot(aggregation[,1], aggregation[,2], pch = 20, xlab = "x1", ylab = "x2", main = "aggregation")
plot(compound[,1], compound[,2], pch = 20, xlab = "x1", ylab = "x2", main = "compound")
plot(flame[,1], flame[,2], pch = 20, xlab = "x1", ylab = "x2", main = "flame")
plot(path.based[,1], path.based[,2], pch = 20, xlab = "x1", ylab = "x2", main = "path.based")

## ---- message = FALSE, echo=TRUE-----------------------------------------
data(cpu.als)

# call gama evolutionary clustering for k = 3 partitions
# plot.internals = FALSE / do not show fitness values evolution across generations
obj <- gama(dataset = cpu.pca, k = 3, plot.internals = FALSE, seed.p = 42)

# plot the graph of partitions
gama.plot.partitions(obj)

## ---- message = FALSE, echo=FALSE----------------------------------------
# loads data about CPU execution metrics of a distributed
# version of Alternating Least Squares (ALS) algorithm
data(cpu.als)

# a user-defined function to calculate penalties for CPU execution metrics
# whose does not allow the sum of loads above 100\%
my.penalty <- function(m.individual,...) {

  penalty <- 0

  # counts how many centroids results in overflow (inequality > 100)
  sums <- apply(m.individual, 1, sum)
  overflow <- which(sums > 100)
  num_constraints = length(overflow)

  # if there are overflows, subtract each dimension
  # by the maximum proportion of the excess x the number of overflows
  if (num_constraints > 0) {
     penalty <- num_constraints * max(abs(sums[overflow] -100)/sums[overflow])
  }

  return (penalty)
}

# call the gama clustering to maximize ASW criterion (default)
# and delegates to GAMA choose the best k value
obj <- gama(data = cpu.als, penalty.function = my.penalty, generations = 150, seed.p = 42)

gama.plot.partitions(obj, view = "total.sum")


## ---- message = FALSE, echo=FALSE----------------------------------------
obj <- gama(compound, k = 6, plot.internals = FALSE, fitness.criterion = "CH", seed.p = 42)
gama.plot.partitions(obj)

## ---- message = FALSE, echo=FALSE----------------------------------------
obj <- gama(dataset = aggregation, k = 7, plot.internals = FALSE, fitness.criterion = "DI", seed.p = 42)
gama.plot.partitions(obj)

## ---- message = FALSE, echo=FALSE----------------------------------------
best.k <- gama.how.many.k(path.based, "minimal")
obj <- gama(path.based, k = best.k, plot.internals = FALSE, seed.p = 42)
gama.plot.partitions(obj)

## ---- echo=TRUE----------------------------------------------------------
sessionInfo()

