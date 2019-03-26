library(eechidna)


### Name: abs2011
### Title: 2011 Australian Census data on all 150 electorates
### Aliases: abs2011
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2011)
abs2011 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()




