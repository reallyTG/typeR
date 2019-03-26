library(eechidna)


### Name: abs2007
### Title: Imputed Australian Census data for the electorates in place at
###   time of the 2007 Federal election
### Aliases: abs2007
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2007)
abs2007 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()

# Join with two-party preferred voting data
library(ggplot2)
data(tpp07)
election2007 <- left_join(abs2007, tpp07, by = "UniqueID")
# See relationship between personal income and Liberal/National support
ggplot(election2007, aes(x = MedianPersonalIncome, y = LNP_Percent)) + geom_point() + geom_smooth()



