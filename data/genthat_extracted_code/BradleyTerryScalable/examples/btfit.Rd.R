library(BradleyTerryScalable)


### Name: btfit
### Title: Fits the Bradley-Terry model
### Aliases: btfit

### ** Examples

citations_btdata <- btdata(BradleyTerryScalable::citations)
fit1 <- btfit(citations_btdata, 1)
summary(fit1)
toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
fit2a <- btfit(toy_btdata, 1)
summary(fit2a)
fit2b <- btfit(toy_btdata, 1.1)
summary(fit2b)
fit2c <- btfit(toy_btdata, 1, subset = function(x) length(x) > 3)
summary(fit2c)



