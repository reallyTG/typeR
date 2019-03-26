library(gama)


### Name: gama
### Title: Segments a dataset by using genetic search.
### Aliases: gama
### Keywords: file

### ** Examples


# loading flame dataset
data(flame)

# segmentation of the flame dataset in k = 2 partitions
# the 'plot.internals' says to the program do not plot the graphs about
# genetic evolution search and silhouette index
gama.obj <- gama(flame, k = 4, plot.internals = FALSE, generations = 30)
# ** use at least 100 generations for simple datasets and 500 for complex datasets

# it draws the partitions to which each element belongs
gama.plot.partitions(gama.obj)

## Not run: 
##D 
##D # loads data about CPU execution metrics of a distributed
##D # version of Alternating Least Squares (ALS) algorithm
##D data(cpu.als)
##D 
##D # a user-defined function to calculate penalties for CPU execution metrics
##D # whose does not allow the sum of loads above 100%
##D my.penalty <- function(m.individual,...) {
##D 
##D   penalty <- 0
##D 
##D   # counts how many centroids results in overflow (inequality > 100)
##D   sums <- apply(m.individual, 1, sum)
##D   overflow <- which(sums > 100)
##D   num_constraints = length(overflow)
##D 
##D   # if there are overflows, subtract each dimension
##D   # by the maximum proportion of the excess x the number of overflows
##D   if (num_constraints > 0) {
##D      penalty <- num_constraints * max(abs(sums[overflow] -100)/sums[overflow])
##D   }
##D 
##D   return (penalty)
##D }
##D 
##D # call the gama clustering to maximize Dunn index criterion
##D # by using 500 generations and delegates to GAMA to choose the best k value
##D gama.obj <- gama(data = cpu.als, fitness.criterion = "DI",
##D                 generations = 500, penalty.function = my.penalty)
##D 
##D print(gama.obj)
##D 
## End(Not run)



