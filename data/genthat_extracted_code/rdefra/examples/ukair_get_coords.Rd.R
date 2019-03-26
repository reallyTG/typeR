library(rdefra)


### Name: ukair_get_coords
### Title: Get Easting and Northing coordinates from DEFRA
### Aliases: ukair_get_coords

### ** Examples

 ## Not run: 
##D  # Case a: alphanumeric string
##D  ukair_get_coords("UKA12536")
##D 
##D  # Case b: vector of strings
##D  ukair_get_coords(c("UKA15910", "UKA15956", "UKA16663", "UKA16097"))
##D 
##D  # Case c: data frame
##D  ukair_get_coords(ukair_catalogue()[1:10,])
##D  
## End(Not run)




