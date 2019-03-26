library(forestmangr)


### Name: forest_structure
### Title: Get the forest horizontal, vertical and internal structure
### Aliases: forest_structure

### ** Examples

library(forestmangr)
data("exfm20")
exfm20

# Get the forest's horizontal structure:
forest_structure(exfm20, "scientific.name", "dbh", "transect", 10000)

# area plot as a variable name:
forest_structure(exfm20, "scientific.name", "dbh", "transect", "plot.area") 

# Get the forest's horizontal and vertical structure.
# The vertical structure variable can either be the height variable,
# or a factor variable with the horizontal strata:
forest_structure(exfm20, "scientific.name", "dbh", "transect", 10000, "canopy.pos") 

# Get the forest's horizontal, vertical and internal structure:
forest_structure(exfm20, "scientific.name", "dbh", "transect", 10000, "canopy.pos", "light") 




