library(oce)


### Name: sectionSort
### Title: Sort a Section
### Aliases: sectionSort

### ** Examples

## Not run: 
##D # Eastern North Atlantic, showing Mediterranean water;
##D # sorting by longitude makes it easier to compare
##D # the map and the section.
##D library(oce)
##D data(section)
##D s <- sectionGrid(subset(section, -30 <= longitude))
##D ss <- sectionSort(ss, by="longitude")
##D plot(ss)
## End(Not run)




