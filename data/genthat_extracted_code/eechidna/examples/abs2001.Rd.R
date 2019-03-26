library(eechidna)


### Name: abs2001
### Title: 2001 Australian Census data on all 150 electorates
### Aliases: abs2001
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2001)
abs2001 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()

# Join with two-party preferred voting data
library(ggplot2)
data(tpp01)
election2001 <- left_join(abs2001, tpp01, by = "UniqueID")
# See relationship between personal income and Liberal/National support
ggplot(election2001, aes(x = MedianPersonalIncome, y = LNP_Percent)) + geom_point() + geom_smooth()



