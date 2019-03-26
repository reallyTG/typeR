library(ICD10gm)


### Name: icd_history
### Title: Historize a list of ICD codes to cover the specified years
### Aliases: icd_history

### ** Examples

# Between 2018 and 2019, causalgia (G56.4) was reclassified
# under G90 as a complex regional pain syndrome
icd_meta <- data.frame(ICD = "G56.4", ICD_LABEL = "Causalgia")
icd_meta_expanded <- icd_expand(icd_meta, year = 2018, col_meta = "ICD_LABEL")
icd_history(icd_meta_expanded, years = 2018:2019)



