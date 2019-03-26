library(ukbtools)


### Name: ukb_icd_prevalence
### Title: Returns the prevalence for an ICD diagnosis
### Aliases: ukb_icd_prevalence

### ** Examples

## Not run: 
##D # ICD-10 code I74, Arterial embolism and thrombosis
##D ukb_icd_prevalence(my_ukb_data, icd.version = 10, icd.diagnosis = "I74")
##D 
##D # ICD-10 chapter 9, disease block I00–I99, Diseases of the circulatory system
##D ukb_icd_prevalence(my_ukb_data, icd.version = 10, icd.diagnosis = "I")
##D 
##D # ICD-10 chapter 2, C00-D49, Neoplasms
##D ukb_icd_prevalence(my_ukb_data, icd.version = 10, icd.diagnosis = "C|D[0-4].")
## End(Not run)




