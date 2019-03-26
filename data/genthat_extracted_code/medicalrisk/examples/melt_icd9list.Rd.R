library(medicalrisk)


### Name: melt_icd9list
### Title: Convert ICD-9-CM code list to dataframe
### Aliases: melt_icd9list

### ** Examples

cases <- data.frame(id=c(1,2), icd9list=c('162.4,070.30,155.0,401.9','996.52,E878.8,V45.86'))
melt_icd9list(cases, "id", "icd9list")



