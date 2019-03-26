library(tsbox)


### Name: ts_ts
### Title: Convert Everything to Everything
### Aliases: ts_ts ts_data.frame ts_ts ts_df ts_ts ts_data.table ts_ts
###   ts_dt ts_ts ts_tbl ts_ts ts_tibbletime ts_ts ts_timeSeries ts_ts
###   ts_ts ts_tsibble ts_ts ts_tslist ts_ts ts_xts ts_ts ts_zoo

### ** Examples


x.ts <- ts_c(mdeaths, fdeaths)
head(x.ts)
head(ts_df(x.ts))

suppressMessages(library(dplyr))
head(ts_tbl(x.ts))

suppressMessages(library(data.table))
head(ts_dt(x.ts))

suppressMessages(library(xts))
head(ts_xts(x.ts))

# heuristic time conversion
# 1 momth: approx. 1/12 year
head(ts_df(AirPassengers))

# exact time conversion
# 1 trading day: exactly 1/260 year
head(ts_df(EuStockMarkets))

# multiple id
multi.id.df <- rbind(
  within(ts_df(ts_c(fdeaths, mdeaths)), type <- "level"),
  within(ts_pc(ts_df(ts_c(fdeaths, mdeaths))), type <- "pc")
)
head(ts_ts(multi.id.df))
ts_plot(multi.id.df)




