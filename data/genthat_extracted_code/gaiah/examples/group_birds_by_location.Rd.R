library(gaiah)


### Name: group_birds_by_location
### Title: Group bird isotope data by locations
### Aliases: group_birds_by_location

### ** Examples

# first run the example for extract_isopredictions to get the variable "x"
example("extract_isopredictions")

# If this were run it gives an error because there is only 1 bird at the
# location "Charlevoix"
## Not run: 
##D group_birds_by_location(x, feather_isotope_col = "Isotope.Value", location_col = "Location")
## End(Not run)


# remove that one bird at Charlevoix and re-run
y <- x %>%
  dplyr::filter(Location != "Charlevoix")

# then group birds by location
gbl <- group_birds_by_location(D = y,
                               feather_isotope_col = "Isotope.Value",
                               location_col = "Location")



