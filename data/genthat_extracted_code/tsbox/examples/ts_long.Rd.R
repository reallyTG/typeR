library(tsbox)


### Name: ts_long
### Title: Reshaping Multiple Time Series
### Aliases: ts_long ts_long ts_wide

### ** Examples

df.wide <- ts_wide(ts_df(ts_c(mdeaths, fdeaths)))
head(df.wide)
head(ts_long(df.wide))



