library(passport)


### Name: parse_country
### Title: Parse country names to standardized form
### Aliases: parse_country

### ** Examples

parse_country(c("United States", "USA", "U.S.", "us", "United States of America"))

## Not run: 
##D # Unicode support for parsing accented or non-Latin scripts
##D parse_country(c("\u65e5\u672c", "Japon", "\u0698\u0627\u067e\u0646"), how = "google")
##D #> [1] "JP" "JP" "JP" "JP"
##D 
##D # Parse distinct place names via geocoding APIs
##D parse_country(c("1600 Pennsylvania Ave, DC", "Eiffel Tower"), how = "google")
##D #> [1] "US" "FR"
## End(Not run)




