library(survivalAnalysis)


### Name: analyse_multivariate
### Title: Multivariate analysis (Cox Regression)
### Aliases: analyse_multivariate analyze_multivariate

### ** Examples

library(magrittr)
library(dplyr)
survival::colon %>%
   analyse_multivariate(vars(time, status),
                        vars(rx, sex, age, obstruct, perfor, nodes, differ, extent)) %>%
   print()



