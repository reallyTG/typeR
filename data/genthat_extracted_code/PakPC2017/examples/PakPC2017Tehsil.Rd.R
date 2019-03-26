library(PakPC2017)


### Name: PakPC2017Tehsil
### Title: Pakistan Tehsil data from Pakistan Population Census 2017
### Aliases: PakPC2017Tehsil
### Keywords: datasets

### ** Examples

library(PakPC2017)
library(dplyr)
library(magrittr)
data("PakPC2017Tehsil")

PakPC2017Tehsil %>%
  group_by(Province, Division, District) %>%
  summarise(
    Pop1998 = sum(Pop1998, na.rm = TRUE)
  , Pop2017 = sum(Pop2017, na.rm = TRUE))

 PakPC2017Tehsil %>%
  filter(District == "Faisalabad")



