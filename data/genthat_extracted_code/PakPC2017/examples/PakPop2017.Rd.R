library(PakPC2017)


### Name: PakPop2017
### Title: Pakistan Population data from Pakistan Population Census 2017
### Aliases: PakPop2017
### Keywords: datasets

### ** Examples

library(PakPC2017)
library(dplyr)
library(magrittr)
data("PakPop2017")

PakPop2017 %>%
  group_by(Province, Division, District) %>%
  summarise(Pop2017 = sum(Pop2017, na.rm = TRUE))

 PakPop2017 %>%
  filter(District == "FAISALABAD DISTRICT")



