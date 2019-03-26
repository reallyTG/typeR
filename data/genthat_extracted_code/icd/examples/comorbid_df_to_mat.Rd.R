library(icd)


### Name: comorbid_df_to_mat
### Title: convert comorbidity matrix to data frame
### Aliases: comorbid_df_to_mat icd_comorbid_df_to_mat
###   icd_comorbid_mat_to_df

### ** Examples

longdf <- icd_long_data(
            visit = c("a", "b", "b", "c"),
            icd9 = c("441", "4240", "443", "441")
            )
cmbdf <- icd9_comorbid_elix(longdf, return_df = TRUE)
class(cmbdf)
rownames(cmbdf)
mat.out <- comorbid_df_to_mat(cmbdf)
stopifnot(is.matrix(mat.out))
mat.out[, 1:4]



