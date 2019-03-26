library(eechidna)


### Name: abs2006
### Title: 2006 Australian Census data on all 150 electorates (2004
###   boundaries)
### Aliases: abs2006
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr) 
data(abs2006)
abs2006 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()




