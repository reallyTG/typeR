library(recmap)


### Name: recmapGRASP
### Title: Greedy Randomized Adaptive Search Procedure Wrapper Function for
###   recmap
### Aliases: recmapGRASP

### ** Examples


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
##D res <- recmapGRASP(getUS_map())
##D plot(res$Map, main = "Input Map") 
##D plot(res$Cartogram, main = "Output Cartogram")
## End(Not run)




