library(radiant.model)


### Name: write.coeff
### Title: Write coefficient table for linear and logistic regression
### Aliases: write.coeff

### ** Examples

regress(diamonds, rvar = "price", evar = c("carat", "clarity", "x"), check = "standardize") %>%
  write.coeff(sort = TRUE) %>%
  format_df(dec = 3)




