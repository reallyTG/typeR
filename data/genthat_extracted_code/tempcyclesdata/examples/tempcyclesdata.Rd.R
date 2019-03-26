library(tempcyclesdata)


### Name: tempcyclesdata
### Title: Temperature cycling dataset from Wang & Dillon NCC 2014.
###   doi:10.1038/nclimate2378
### Aliases: tempcyclesdata
### Keywords: datasets

### ** Examples

summary(tempcyclesdata)
if (require("dplyr")) {
tempcyclesdata %>%
  filter(period == "stdr") %>%
  group_by(region) %>%
  summarise(mean_DTC = mean(DTC))
}



