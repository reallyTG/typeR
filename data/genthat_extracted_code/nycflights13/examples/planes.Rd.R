library(nycflights13)


### Name: planes
### Title: Plane metadata.
### Aliases: planes
### Keywords: datasets

### ** Examples

if (require("dplyr")) {
planes

# Flights that don't have plane metadata
flights %>% anti_join(planes, "tailnum")

}



