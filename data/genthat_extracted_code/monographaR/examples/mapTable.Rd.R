library(monographaR)


### Name: mapTable
### Title: Generates a presence/absence matrix of species on grids or
###   countries
### Aliases: mapTable

### ** Examples


## loading the example data

data(monographaR_examples)
monographaR_examples$map_data -> data
head(data)

## running the function with grid

map.table <- mapTable(data, type="grid", resolution=3, 
write.output=FALSE)
  
map.table$table
t(map.table$table)

map.table$grid -> grid

data(wrld_simpl)
plot(grid, border="white")
plot(wrld_simpl, add=TRUE)
plot(grid, add=TRUE)
raster::text(grid, grid@data$layer, cex=1)

## running the function with countries

map.table.country <- mapTable(data, type="country")
map.table.country




