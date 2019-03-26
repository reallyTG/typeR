library(survivalAnalysis)


### Name: analyse_survival
### Title: Univariate survival analysis
### Aliases: analyse_survival analyze_survival

### ** Examples

library(magrittr)
library(dplyr)
survival::aml %>%
  analyse_survival(vars(time, status), x) %>%
  print



