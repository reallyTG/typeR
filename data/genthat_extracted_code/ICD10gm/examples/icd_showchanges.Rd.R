library(ICD10gm)


### Name: icd_showchanges
### Title: Show all changes in ICD history relating to the 3-digit codes
###   contained in the data.frame icd_in. The output of icd_expand can be
###   passed directly to this function to display relevant changes.
### Aliases: icd_showchanges

### ** Examples

dat_icd <- icd_expand(
   data.frame(ICD_SPEC = c("K52.9")),
   col_icd = "ICD_SPEC",
   year = 2019)
icd_showchanges(dat_icd)




