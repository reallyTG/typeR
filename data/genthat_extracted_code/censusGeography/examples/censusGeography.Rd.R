library(censusGeography)


### Name: censusGeography
### Title: Census Geography
### Aliases: censusGeography

### ** Examples

census_city_codes <- c(210, 2489, 5350, 1330)
censusGeography(census_city_codes, type = "city")

# Input can be character type too
census_city_codes <- c("210", "2489", "5350", "1330")
censusGeography(census_city_codes, type = "city")

censusGeography(42, type = "region")

# If no match is found, will return NA for location name
censusGeography(0, type = "region")

census_stateFIP_code <- data.frame(c(1,2,4), c("test", "test2", "test3"))
names(census_stateFIP_code) <- c("code", "character_type_column")
censusGeography(census_stateFIP_code$code, type = "stateFIP")




