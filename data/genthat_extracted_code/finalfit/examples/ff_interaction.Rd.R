library(finalfit)


### Name: ff_interaction
### Title: Make an interaction variable and add to dataframe
### Aliases: ff_interaction finalfit_interaction

### ** Examples


colon_s %>%
  ff_interaction(sex.factor, perfor.factor) %>%
    summary_factorlist("mort_5yr", "sex.factor__perfor.factor")



