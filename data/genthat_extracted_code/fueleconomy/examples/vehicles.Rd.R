library(fueleconomy)


### Name: vehicles
### Title: Vehicle data
### Aliases: vehicles
### Keywords: datasets

### ** Examples

if (require("dplyr")) {
vehicles
vehicles %>% group_by(year) %>% summarise(cty = mean(cty))
}



