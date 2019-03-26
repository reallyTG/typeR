library(recmap)


### Name: recmapGA
### Title: Genetic Algorithm Wrapper Function for recmap
### Aliases: recmapGA

### ** Examples


## The default fitnes function is currently defined as
function(idxOrder, Map, ...){

  Cartogram <- recmap(Map[idxOrder, ])
  # a map region could not be placed; 
  # accept only feasible solutions!
  
  if (sum(Cartogram$topology.error == 100) > 0){return (0)}
  
  1 / sum(Cartogram$relpos.error)
}


## use Genetic Algorithms (GA >=3.0.0) as metaheuristic
set.seed(1)
res <- recmapGA(Map = checkerboard(4), pmutation = 0.25)

op <- par(mfrow = c(1, 3))
plot(res$Map, main = "Input Map") 
plot(res$GA, main="Genetic Algorithm")
plot(res$Cartogram, main = "Output Cartogram")


## US example
getUS_map <- function(){
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

  class(US.Map) <- c('recmap', 'data.frame')
  US.Map
}

## Not run: 
##D # takes 34.268 seconds on CRAN
##D res <- recmapGA(getUS_map(), maxiter = 5)
##D op <- par(ask = TRUE)
##D plot(res)
##D par(op)
##D summary(res)
## End(Not run)



