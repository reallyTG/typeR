library(glassdoor)


### Name: gd_company
### Title: Glassdoor Company Search
### Aliases: gd_company gd_employer gd_company_df gd_employer_df

### ** Examples

if (have_gd_tokens()) {

res = gd_company_df("walmart")
head(res[, c("id", "name")])
res = gd_company_df("Target")
res = gd_company("Dropbox")
}




