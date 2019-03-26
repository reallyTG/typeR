library(BradleyTerryScalable)


### Name: select_components
### Title: Subset a btdata object
### Aliases: select_components

### ** Examples

toy_df_4col <- codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_df_4col)
## The following all return the same component
select_components(toy_btdata, "3", return_graph = TRUE)
select_components(toy_btdata, function(x) length(x) == 4)
select_components(toy_btdata, function(x) "Cyd" %in% x)
select_components(toy_btdata, c(FALSE, FALSE, TRUE))



