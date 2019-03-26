library(icd)


### Name: count_codes
### Title: Count ICD codes or comorbidities for each patient
### Aliases: count_codes icd_count_codes icd_count_comorbid

### ** Examples

  mydf <- data.frame(visit_name = c("r", "r", "s"),
                   icd9 = c("441", "412.93", "042"))
  count_codes(mydf, return_df = TRUE)
  count_codes(mydf)

  cmb <- icd9_comorbid_quan_deyo(mydf, short_code = FALSE, return_df = TRUE)
  count_comorbid(cmb)

  wide <- data.frame(visit_name = c("r", "s", "t"),
                   icd9_1 = c("0011", "441", "456"),
                   icd9_2 = c(NA, "442", NA),
                   icd9_3 = c(NA, NA, "510"))
  count_codes_wide(wide)
  # or:
  library(magrittr)
  wide %>% wide_to_long %>% count_codes



