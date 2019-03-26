library(forcats)


### Name: fct_anon
### Title: Anonymise factor levels
### Aliases: fct_anon

### ** Examples

gss_cat$relig %>% fct_count()
gss_cat$relig %>% fct_anon() %>% fct_count()
gss_cat$relig %>% fct_anon() %>% fct_count()
gss_cat$relig %>% fct_anon("X") %>% fct_count()



