library(icd)


### Name: comorbid_mat_to_df
### Title: convert comorbidity data frame from matrix
### Aliases: comorbid_mat_to_df

### ** Examples

longdf <- icd_long_data(
            visit_id = c("a", "b", "b", "c"),
            icd9 = as.icd9(c("441", "4240", "443", "441")))
mat <- icd9_comorbid_elix(longdf)
class(mat)
typeof(mat)
rownames(mat)
df.out <- comorbid_mat_to_df(mat)
stopifnot(is.data.frame(df.out))
# output data frame has a factor for the visit_name column
stopifnot(identical(rownames(mat), as.character(df.out[["visit_id"]])))
df.out[, 1:4]
# when creating a data frame like this, stringsAsFactors uses
# the system-wide option you may have set e.g. with
# options("stringsAsFactors" = FALSE).
is.factor(df.out[["visit_id"]])



