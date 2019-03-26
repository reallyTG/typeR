library(BradleyTerryScalable)


### Name: vcov.btfit
### Title: Calculate variance-covariance matrix for a btfit object
### Aliases: vcov.btfit

### ** Examples

citations_btdata <- btdata(BradleyTerryScalable::citations)
#' fit1 <- btfit(citations_btdata, 1)
#' vcov(fit1)
toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
fit2a <- btfit(toy_btdata, 1)
vcov(fit2a)
vcov(fit2a, subset = function(x) length(x) > 3)
vcov(fit2a, subset = function(x) "Cyd" %in% names(x))
fit2b <- btfit(toy_btdata, 1.1)
vcov(fit2b, ref = "Cyd")




