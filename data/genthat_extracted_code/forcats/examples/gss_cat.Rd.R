library(forcats)


### Name: gss_cat
### Title: A sample of categorical variables from the General Social survey
### Aliases: gss_cat
### Keywords: datasets

### ** Examples

gss_cat

fct_count(gss_cat$relig)
fct_count(fct_lump(gss_cat$relig))



