library(forestmangr)


### Name: lm_table
### Title: Fit linear regressions by group, and get different output
###   options.
### Aliases: lm_table

### ** Examples

library(forestmangr)
library(dplyr)

data("exfm19")
exfm19

# Fit Schumacher and Hall model for volume estimation, and get
# coefficient, R2 and error values:

lm_table(exfm19, log(VWB) ~  log(DBH) + log(TH))   

# Fit SH model by group:
lm_table(exfm19, log(VWB) ~  log(DBH) + log(TH), "STRATA")

# This can also be done using dplyr::group_by:
exfm19 %>% 
  group_by(STRATA) %>% 
  lm_table(log(VWB) ~  log(DBH) + log(TH) )
  
# It's possible to merge the original data with the table containg the coefficients
# using the output parameter:
fit <- lm_table(exfm19, log(VWB) ~  log(DBH) + log(TH), "STRATA", output = "merge")
head(fit)

# It's possible to merge the original data with the table,
# and get the estimated values for this model:
fit <- lm_table(exfm19, log(VWB) ~  log(DBH) + log(TH),"STRATA",
 output = "merge_est", est.name = "VWB_EST") 
head(fit)
       
# It's possible to further customize the output,
# unnesting the nested variables provided when output is defined as "nest":
lm_table(exfm19, log(VWB) ~  log(DBH) + log(TH),"STRATA", output = "nest")




