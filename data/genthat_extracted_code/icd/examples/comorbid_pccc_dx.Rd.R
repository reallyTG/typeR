library(icd)


### Name: comorbid_pccc_dx
### Title: Calculate pediatric complex chronic conditions (PCCC)
###   comorbidities
### Aliases: comorbid_pccc_dx comorbid_pccc_pcs icd9_comorbid_pccc_dx
###   icd10_comorbid_pccc_dx icd9_comorbid_pccc_pcs icd10_comorbid_pccc_pcs

### ** Examples

# not pediatric data, but let's look for this example
head(icd9_comorbid_pccc_dx(wide_to_long(vermont_dx)))
# Six random codes from each PCCC procedure code map. 'icd' will use
# an heuristic to guess whether ICD-9 or ICD-10:
pts <- data.frame(encounters = c(10, 11, 12),
                  icd9_pcs = c("0152", "304", "0050"),
                  icd10_pcs = c("0B110Z4", "02YA0Z2", "031209D"))
comorbid_pccc_pcs(pts, icd_name = "icd9_pcs", return_binary = TRUE)
comorbid_pccc_pcs(pts, icd_name = "icd10_pcs", return_binary = TRUE)

# All ICD-9 procedure codes are numeric, some ICD-10 procedure codes
# are numeric, so best to call functions directly:
pts <- data.frame(encounters = c(100), icd10_pcs = c("0016070"))
icd10_comorbid_pccc_pcs(pts, icd_name = "icd10_pcs")



