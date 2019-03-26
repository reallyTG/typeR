library(eechidna)


### Name: abs2004
### Title: Imputed Australian Census data for the electorates in place at
###   time of the 2004 Federal election
### Aliases: abs2004
### Keywords: datasets

### ** Examples

library(eechidna)
library(dplyr)
data(abs2004)
abs2004 %>% select(DivisionNm, MedianAge, Unemployed, NoReligion, MedianPersonalIncome) %>% head()

# Join with two-party preferred voting data
library(ggplot2)
data(tpp04)
election2004 <- left_join(abs2004, tpp04, by = "UniqueID")
# See relationship between personal income and Liberal/National support
ggplot(election2004, aes(x = MedianPersonalIncome, y = LNP_Percent)) + geom_point() + geom_smooth()



