library(PKPDmisc)


### Name: s_quantiles_
### Title: summarize quantiles for a column
### Aliases: s_quantiles_ s_quantiles

### ** Examples

library(dplyr)
sd_oral_richpk %>% group_by(Gender, Time) %>% s_quantiles(Conc, c(0.05, 0.5, 0.95))



