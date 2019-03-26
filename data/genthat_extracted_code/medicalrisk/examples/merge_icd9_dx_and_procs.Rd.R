library(medicalrisk)


### Name: merge_icd9_dx_and_procs
### Title: Merge ICD-9-CM diagnostic and procedure codes
### Aliases: merge_icd9_dx_and_procs

### ** Examples

cases <- data.frame(id=c(1,2),
                    icd9dxlist=c('162.4,070.30,155.0,401.9','996.52,E878.8,V45.86'), 
                    icd9plist=c('38.16','38.42'))
dx_df <- melt_icd9list(cases, "id", "icd9dxlist")
proc_df <- melt_icd9list(cases, "id", "icd9plist")
merge_icd9_dx_and_procs(dx_df, proc_df)



