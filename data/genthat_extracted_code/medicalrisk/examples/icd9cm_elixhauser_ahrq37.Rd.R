library(medicalrisk)


### Name: icd9cm_elixhauser_ahrq37
### Title: Create AHRQ v3.7 map of ICD-9-CM to Elixhauser comorbidities
### Aliases: icd9cm_elixhauser_ahrq37

### ** Examples

# Identify Elixhauser categories
cases <- data.frame(id=c(1,1,1,2,2,2),
  icd9cm=c("D20206","D24220","D4439","D5064","DE8788","D40403"))
cases_with_cm <- merge(cases, icd9cm_elixhauser_ahrq37(levels(cases$icd9cm)), 
  by.x="icd9cm", by.y="row.names", all.x=TRUE)

# generate crude comorbidity summary for each patient
library(plyr)
ddply(cases_with_cm, .(id), 
  function(x) { data.frame(lapply(x[,3:ncol(x)], any)) })



