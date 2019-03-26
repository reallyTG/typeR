library(panelvar)


### Name: pvarfeols
### Title: Fixed Effects Estimator for PVAR Model
### Aliases: pvarfeols

### ** Examples

data(Cigar)
ex1_feols <-
pvarfeols(dependent_vars = c("log_sales", "log_price"),
          lags = 1,
          exog_vars = c("cpi"),
          transformation = "demean",
          data = Cigar,
          panel_identifier= c("state", "year"))



