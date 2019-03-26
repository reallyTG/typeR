library(eechidna)


### Name: abs2010
### Title: Imputed Australian Census data for the electorates in place at
###   time of the 2010 Federal election
### Aliases: abs2010
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2010)
abs2010 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()

# Join with two-party preferred voting data
library(ggplot2)
data(tpp10)
election2010 <- left_join(abs2010, tpp10, by = "UniqueID")
# See relationship between personal income and Liberal/National support
ggplot(election2010, aes(x = MedianPersonalIncome, y = LNP_Percent)) + geom_point() + geom_smooth()



