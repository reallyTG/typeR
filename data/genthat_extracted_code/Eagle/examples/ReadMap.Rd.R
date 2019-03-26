library(Eagle)


### Name: ReadMap
### Title: Read map file
### Aliases: ReadMap

### ** Examples

# Read in  example map data from ./extdata/

# find the full location of the map data 
complete.name <- system.file('extdata', 'map.txt', package='Eagle')
  
# read in map data 
map_obj <- ReadMap(filename=complete.name) 
                               
# look at first few rows of the map file
head(map_obj)





