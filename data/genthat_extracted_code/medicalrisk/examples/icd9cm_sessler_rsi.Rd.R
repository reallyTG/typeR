library(medicalrisk)


### Name: icd9cm_sessler_rsi
### Title: Returns composite Sessler risk stratification index, given a
###   list of ICD-9-CM codes.
### Aliases: icd9cm_sessler_rsi

### ** Examples

# Calculate RSI for each patient ("id") in dataframe
cases <- data.frame(id=c(1,1,1,2,2,2),
  icd9cm=c("D20206","D24220","D4439","D5064","DE8788","D40403"))
library(plyr)
ddply(cases, .(id), function(x) { icd9cm_sessler_rsi(x$icd9cm) } )



