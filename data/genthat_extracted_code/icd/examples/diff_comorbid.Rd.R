library(icd)


### Name: diff_comorbid
### Title: show the difference between two comorbidity mappings
### Aliases: diff_comorbid diff_comorbid.list icd_diff_comorbid.list
###   icd_diff_comorbid

### ** Examples

# compare CHF for ICD-10 mappings from Elixhauser and AHRQ
diff_comorbid(icd10_map_elix, icd10_map_ahrq, show = FALSE)[["CHF"]]
## Not run: 
##D # default is to show the results in a human readable manner:
##D diff_result <- diff_comorbid(icd9_map_elix, icd9_map_ahrq)[["CHF"]]
##D # show differences for
##D # give full report on all comorbidities for these mappings
##D diff_result <- diff_comorbid(icd9_map_elix, icd9_map_ahrq, show = FALSE)
##D 
##D # the following outputs a summary to the console:
##D diff_comorbid(icd9_map_elix, icd9_map_ahrq)
## End(Not run)



