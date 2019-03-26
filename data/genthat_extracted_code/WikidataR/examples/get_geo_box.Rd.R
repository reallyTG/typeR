library(WikidataR)


### Name: get_geo_box
### Title: Get geographic entities based on a bounding box
### Aliases: get_geo_box

### ** Examples

# Simple bounding box
bruges_box <- WikidataR:::get_geo_box("Q12988", "NorthEast", "Q184287", "SouthWest")

# Custom language
bruges_box_fr <- WikidataR:::get_geo_box("Q12988", "NorthEast", "Q184287", "SouthWest",
                                        language = "fr")




