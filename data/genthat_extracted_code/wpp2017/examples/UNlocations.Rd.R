library(wpp2017)


### Name: UNlocations
### Title: United Nations Table of Locations
### Aliases: UNlocations
### Keywords: datasets

### ** Examples

data(UNlocations)
# Find high income countries in Africa (based on World Bank groups)
grouprec <- subset(UNlocations, name == "High-income countries")
# grouprec$location_type is 1503, thus look for column agcode_1503 
subset(UNlocations, agcode_1503 == grouprec$country_code & 
                            location_type == 4 & area_name == "Africa")



