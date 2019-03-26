library(eechidna)


### Name: abs2006_e07
### Title: 2006 Australian Census data on all 150 electorates (2007
###   boundaries)
### Aliases: abs2006_e07
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2006_e07)
abs2006_e07 %>% 
select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% 
head()




