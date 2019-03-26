library(PKPDmisc)


### Name: s_pauc_
### Title: summarize paucs
### Aliases: s_pauc_ s_pauc

### ** Examples

library(dplyr)
sd_oral_richpk  %>% group_by(ID) %>% s_pauc(Time, Conc, list(c(0,8), c(8, 24)))
sd_oral_richpk  %>% group_by(ID) %>% s_pauc_("Time", "Conc", list(c(0,8), c(8, 24)))



