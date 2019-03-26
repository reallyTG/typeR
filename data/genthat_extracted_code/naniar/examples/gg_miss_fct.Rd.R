library(naniar)


### Name: gg_miss_fct
### Title: Plot the number of missings for each variable, broken down by a
###   factor
### Aliases: gg_miss_fct

### ** Examples


gg_miss_fct(x = riskfactors, fct = marital)
library(ggplot2)
gg_miss_fct(x = riskfactors, fct = marital) + labs(title = "NA in Risk Factors and Marital status")





