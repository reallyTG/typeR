library(ExPanDaR)


### Name: prepare_ext_obs_table
### Title: Prepares a Table Displaying Extreme Observations
### Aliases: prepare_ext_obs_table

### ** Examples

t <- prepare_ext_obs_table(russell_3000, n = 10,
                           cs_id = c("coid", "coname"),
                           ts_id = "period", var = "sales")
t$df



