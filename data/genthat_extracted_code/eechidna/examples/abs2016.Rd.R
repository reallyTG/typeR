library(eechidna)


### Name: abs2016
### Title: 2016 Australian Census data on all 150 electorates
### Aliases: abs2016
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2016)
abs2016 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()

# Join with two-party preferred voting data
library(ggplot2)
data(tpp16)
election2016 <- left_join(abs2016, tpp16, by = "UniqueID")
# See relationship between personal income and Liberal/National support
ggplot(election2016, aes(x = MedianPersonalIncome, y = LNP_Percent)) + geom_point() + geom_smooth()



