library(icd)


### Name: filter_poa
### Title: Filters data frame based on present-on-arrival flag
### Aliases: filter_poa filter_poa_yes filter_poa_no filter_poa_not_no
###   filter_poa_not_yes icd_filter_poa icd_filter_poa_no
###   icd_filter_poa_not_no icd_filter_poa_not_yes icd_filter_poa_yes
### Keywords: manip

### ** Examples

## Not run: 
##D library(magrittr, warn.conflicts = FALSE, quietly = TRUE)
##D myData <- data.frame(
##D   visit_id = c("v1", "v2", "v3", "v4"),
##D   diag = c("39891", "39790", "41791", "4401"),
##D   poa = c("Y", "N", NA, "Y"),
##D   stringsAsFactors = FALSE
##D )
##D myData %>% filter_poa_not_no() %>% comorbid_ahrq()
##D # can fill out named fields also:
##D myData %>% filter_poa_yes(poa_name="poa") %>%
##D   comorbid_ahrq(icd_name = "diag", visit_name = "visit_id",
##D   short_code = TRUE)
##D # can call the core comorbid() function with an arbitrary mapping
##D myData %>%
##D   filter_poa_yes %>%
##D   comorbid_elix(icd_name = "diag", visit_name = "visit_id",
##D   short_mapping = TRUE)
## End(Not run)



