library(BradleyTerryScalable)


### Name: btdata
### Title: Create a btdata object
### Aliases: btdata summary.btdata

### ** Examples

citations_btdata <- btdata(BradleyTerryScalable::citations)
summary(citations_btdata)
toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
summary(toy_btdata)



