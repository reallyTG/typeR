library(tsbox)


### Name: ts_index
### Title: Indices from Levels or Percentage Rates
### Aliases: ts_index ts_compound ts_index

### ** Examples

head(ts_compound(ts_pc(ts_c(fdeaths, mdeaths))))
head(ts_index(ts_df(ts_c(fdeaths, mdeaths)), "1974-02-01"))
## No test: 
ts_plot(
  `My Expert Knowledge` = ts_chain(
    mdeaths, 
    ts_compound(ts_bind(ts_pc(mdeaths), 15, 23, 33))),
  `So Far` = mdeaths,
  title = "A Very Manual Forecast"
)
## End(No test)



