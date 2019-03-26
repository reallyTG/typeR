library(heatwaveR)


### Name: ts2clm
### Title: Make a climatology from a daily time series.
### Aliases: ts2clm

### ** Examples

res <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
res[1:10, ]

# Or if one only wants the 366 day climatology
res_clim <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"),
                   clmOnly = TRUE)
res_clim[1:10, ]

# Or if one wants the variance column included in the results
res_var <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"),
                  var = TRUE)
res_var[1:10, ]




