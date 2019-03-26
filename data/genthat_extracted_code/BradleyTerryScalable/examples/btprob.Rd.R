library(BradleyTerryScalable)


### Name: btprob
### Title: Calculates Bradley-Terry probabilities
### Aliases: btprob

### ** Examples

citations_btdata <- btdata(BradleyTerryScalable::citations)
fit1 <- btfit(citations_btdata, 1)
btprob(fit1)
btprob(fit1, as_df = TRUE)
toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
fit2a <- btfit(toy_btdata, 1)
btprob(fit2a)
btprob(fit2a, as_df = TRUE)
btprob(fit2a, subset = function(x) "Amy" %in% names(x))
fit2b <- btfit(toy_btdata, 1.1)
btprob(fit2b, as_df = TRUE)



