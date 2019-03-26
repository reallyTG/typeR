library(icd)


### Name: van_walraven
### Title: Calculate van Walraven Elixhauser Score
### Aliases: van_walraven van_walraven.data.frame
###   van_walraven_from_comorbid icd_van_walraven.data.frame
###   icd_van_walraven icd_van_walraven_from_comorbid

### ** Examples

mydf <- data.frame(visit_name = c("a", "b", "c"),
                   icd9 = c("412.93", "441", "042"))
van_walraven(mydf)
# or calculate comorbodities first:
cmb <- icd9_comorbid_quan_elix(mydf, short_code = FALSE, hierarchy = TRUE)
vwr <- van_walraven_from_comorbid(cmb)
stopifnot(identical(van_walraven(mydf), vwr))

# alternatively return as data frame in 'tidy' format
van_walraven(mydf, return_df = TRUE)



