library(fingertipsR)


### Name: area_types
### Title: Area types
### Aliases: area_types

### ** Examples

# Returns a data frame with all levels of area and how they map to one another
area_types()

# Returns a data frame of county and unitary authority mappings
 area_types("counties")

# Returns a data frame of both counties, district
# and unitary authorities and their respective mappings
areas <- c("counties","district")
area_types(areas)

# Uses AreaTypeID to filter area types
area_types(AreaTypeID = 152)



