library(tstools)


### Name: df_to_reg_ts
### Title: Turn data.frame to Regular Monthly or Quarterly Time Series
### Aliases: df_to_reg_ts

### ** Examples

start_m <- as.Date("2017-01-01")
df_missing <- data.frame( 
 date = seq(start_m, by='2 months', length=6),
 value = 1:6,
another_value = letters[1:6],
yet_another_col = letters[6:1]
)
df_to_reg_ts(df_missing,c("value","another_value"))
df_to_reg_ts(df_missing, c("value","another_value"), return_ts = FALSE)



