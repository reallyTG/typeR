library(icd)


### Name: charlson
### Title: Calculate Charlson Comorbidity Index (Charlson Score)
### Aliases: charlson charlson.data.frame icd_charlson
###   icd_charlson.data.frame

### ** Examples

mydf <- data.frame(visit_name = c("a", "b", "c"),
                   icd9 = c("441", "412.93", "042"))
charlson(mydf)
cmb <- icd9_comorbid_quan_deyo(mydf)
cmb
# can specify short_code directly instead of guessing
charlson(mydf, short_code = FALSE, return_df = TRUE)
charlson_from_comorbid(cmb)



