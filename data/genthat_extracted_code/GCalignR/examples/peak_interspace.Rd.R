library(GCalignR)


### Name: peak_interspace
### Title: Estimate the observed space between peaks within chromatograms
### Aliases: peak_interspace

### ** Examples

## plotting with defaults
peak_interspace(data = peak_data, rt_col_name = "time")
## plotting up to the 0.95 quantile
peak_interspace(data = peak_data,rt_col_name = "time",quantile_range = c(0,0.95))
## return the 0.1 quantile
peak_interspace(data = peak_data,rt_col_name = "time", quantiles = 0.1)




