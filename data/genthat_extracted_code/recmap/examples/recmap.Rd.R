library(recmap)


### Name: recmap
### Title: Compute a Rectangular Statistical Cartogram
### Aliases: recmap RecMap cartogram is.recmap all.equal.recmap
### Keywords: package cartogram value-by-area-map

### ** Examples

map <- checkerboard(2)
cartogram <- recmap(map)

map
cartogram

op <- par(mfrow = c(1, 2))
plot(map)
plot(cartogram)

## US example
usa <- data.frame(x = state.center$x, 
  y = state.center$y, 
  # make the rectangles overlapping by correcting 
  # lines of longitude distance.
  dx = sqrt(state.area) / 2 
    / (0.8 * 60 * cos(state.center$y * pi / 180)), 
  dy = sqrt(state.area) / 2 / (0.8 * 60), 
  z = sqrt(state.area),
  name = state.name)
      
usa$z <- state.x77[, 'Population']
US.Map <- usa[match(usa$name, 
  c('Hawaii', 'Alaska'), nomatch = 0)  == 0, ]

plot.recmap(US.Map)
plot(recmap(US.Map))
par(op)

# define a fitness function
recmap.fitness <- function(idxOrder, Map, ...){
  Cartogram <- recmap(Map[idxOrder, ])
  # a map region could not be placed; 
  # accept only feasible solutions!
  if (sum(Cartogram$topology.error == 100) > 0){return (0)}
  1 / sum(Cartogram$z / (sqrt(sum(Cartogram$z^2))) 
    * Cartogram$relpos.error)
}


## Not run: 
##D 
##D ## use Genetic Algorithms (GA >=3.0.0) as metaheuristic
##D 
##D M <- US.Map
##D 
##D recmapGA <- ga(type = "permutation", 
##D   fitness = recmap.fitness, 
##D   Map = M,
##D   monitor = gaMonitor,
##D   min = 1, max = nrow(M) , 
##D   popSize = 4 * nrow(M), 
##D   maxiter = 10,
##D   run = 100, 
##D   parallel=TRUE,
##D   pmutation = 0.25)
##D 
##D plot(recmap(M[recmapGA@solution[1,],]))
##D 
##D plot(recmapGA)
##D 
## End(Not run)


## Not run: 
##D # install.packages('rbenchmark')
##D 
##D library(rbenchmark)
##D benchmark(recmap(US.Map[sample(50,50),]), replications=100)
##D ##                              test replications elapsed relative user.self
##D ##1 recmap(US.Map[sample(50, 50), ])          100   1.255        1     1.124
##D ##  sys.self user.child sys.child
##D ##1    0.038          0         0
## End(Not run)

## Have Fun!



