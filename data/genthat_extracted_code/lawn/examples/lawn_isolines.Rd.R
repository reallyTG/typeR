library(lawn)


### Name: lawn_isolines
### Title: Generate Isolines
### Aliases: lawn_isolines

### ** Examples

## Not run: 
##D # pts <- lawn_random(n = 100, bbox = c(0, 30, 20, 50))
##D pts <- lawn_point_grid(c(0, 30, 20, 50), 100, 'miles')
##D pts$features$properties <-
##D   data.frame(temperature = round(rnorm(NROW(pts$features), mean = 5)),
##D   stringsAsFactors = FALSE)
##D breaks <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
##D lawn_isolines(points = pts, breaks, z = 'temperature')
##D 
##D lawn_isolines(pts, breaks, 'temperature') %>% view
## End(Not run)



