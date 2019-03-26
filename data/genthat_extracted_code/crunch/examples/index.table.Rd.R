library(crunch)


### Name: index.table
### Title: Calculate an index table for a CrunchCube
### Aliases: index.table

### ** Examples

## Not run: 
##D  cube_object
##D  #    v7
##D  # v4  C E
##D  #   B 5 2
##D  #   C 5 3
##D  index.table(cube_object, 1)
##D  #    v7
##D  # v4         C         E
##D  #   B 107.1429  85.71429
##D  #   C  93.7500 112.50000
##D  index.table(cube_object, 2)
##D  #    v7
##D  # v4    C   E
##D  #   B 100  80
##D  #   C 100 120
##D  index.table(cube_object, 2, c(0.6, 0.4))
##D  #    v7
##D  # v4          C         E
##D  #   B  83.33333  66.66667
##D  #   C 125.00000 150.00000
## End(Not run)




