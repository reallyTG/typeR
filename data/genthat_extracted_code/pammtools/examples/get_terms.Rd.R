library(pammtools)


### Name: get_terms
### Title: Extract the partial effects of non-linear model terms
### Aliases: get_terms

### ** Examples

library(survival)
fit <- coxph(Surv(time, status) ~ pspline(karno) + pspline(age), data=veteran)
terms_df <- veteran %>% get_terms(fit, terms = c("karno", "age"))
head(terms_df)
tail(terms_df)



