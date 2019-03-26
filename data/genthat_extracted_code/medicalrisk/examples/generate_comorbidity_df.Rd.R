library(medicalrisk)


### Name: generate_comorbidity_df
### Title: Generate a comorbidity dataframe
### Aliases: generate_comorbidity_df

### ** Examples

cases <- data.frame(id=c(1,1,1,2,2,2,2,2), 
         icd9cm=c("D20206","D24220","D4439","D5064","DE8788","D40403","D1960","D1958"))
generate_comorbidity_df(cases)
# generate categories for patients in the \code{vt_inp_sample}
generate_comorbidity_df(vt_inp_sample)
# in this example, D25071 is reduced to "dm" from "dmcx" because D4439 already codes perivasc
# also, D20206 "tumor" and D1970 "mets" lead to just "mets"
# D25001 and D25040 are just "dmcx"
# D45621 and D570 are just "modliver"
cases <- data.frame(id=c(1,1,1,1,2,2,2,2),
  icd9cm=c("D1970","D20206","D25071","D4439","D25001","D25040","D45621","D570"))
generate_comorbidity_df(cases)



