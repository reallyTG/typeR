library(BradleyTerryScalable)


### Name: coef.btfit
### Title: Extract coefficients of a 'btfit' object
### Aliases: coef.btfit

### ** Examples

citations_btdata <- btdata(BradleyTerryScalable::citations)
fit1 <- btfit(citations_btdata, 1)
coef(fit1)
toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
fit2a <- btfit(toy_btdata, 1)
coef(fit2a)
coef(fit2a, subset = function(x) length(x) > 3, as_df = TRUE)
coef(fit2a, subset = function(x) "Amy" %in% names(x))
coef(fit2a, as_df = TRUE)
fit2b <- btfit(toy_btdata, 1.1)
coef(fit2b)
coef(fit2b, ref = "Cyd")



