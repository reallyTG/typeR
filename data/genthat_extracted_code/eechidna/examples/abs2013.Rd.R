library(eechidna)


### Name: abs2013
### Title: Imputed Australian Census data for the electorates in place at
###   time of the 2013 Federal election
### Aliases: abs2013
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2013)
abs2013 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()

# Join with two-party preferred voting data
library(ggplot2)
data(tpp13)
election2013 <- left_join(abs2013, tpp13, by = "UniqueID")
# See relationship between personal income and Liberal/National support
ggplot(election2013, aes(x = MedianPersonalIncome, y = LNP_Percent)) + geom_point() + geom_smooth()



