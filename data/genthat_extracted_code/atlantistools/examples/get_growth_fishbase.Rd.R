library(atlantistools)


### Name: get_growth_fishbase
### Title: Extract growth parameters from http:://www.fishbase.se.
### Aliases: get_growth_fishbase

### ** Examples

## Not run: 
##D # For some reason the examples break with appveyor.
##D fish <- c("Gadus morhua", "Merlangius merlangus")
##D df <- get_growth_fishbase(fish)
##D head(df)
##D 
##D df <- get_growth_fishbase(fish, mirror = "de")
##D head(df)
##D 
##D fish <- c("Sprattus sprattus")
##D df <- get_growth_fishbase(fish)
##D head(df)
##D # Only use for debugging purposes.
##D fish <- read.csv("Z:/my_data_alex/fish_species_names_from_ibts.csv", stringsAsFactors = FALSE)[, 1]
##D url <- get_growth_fishbase(fish)
##D url <- urls$ref_url
## End(Not run)



