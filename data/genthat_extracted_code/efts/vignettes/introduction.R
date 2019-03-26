## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  error = FALSE,
  tidy = FALSE,
  out.extra='style="display:block; margin: auto"', 
  fig.align="center", 
  fig.width=12, 
  fig.height=6, 
  dev='png'
)

## ------------------------------------------------------------------------
library(efts)
ext_data <- system.file('extdata', package='efts')
rain_file <- file.path(ext_data, 'Upper_Murray_sample_rain.nc')
stopifnot(file.exists(rain_file))

rain_dat <- open_efts(rain_file)
class(rain_dat)

## ------------------------------------------------------------------------
print(rain_dat)

## ------------------------------------------------------------------------
cat(sprintf("This rainfall data set has data for %s stations, the lead time dimension is '%s' because this is not forecast data\n", rain_dat$get_station_count(),
rain_dat$get_lead_time_count()))
rain_dat$get_variable_names()
rain_dat$get_variable_dim_names("rain_der")

## ------------------------------------------------------------------------
d <- rain_dat$get_all_series(variable_name = 'rain_der')
head(d)

## ------------------------------------------------------------------------
plot(d[1:48], main="Interpolated rainfall (mm/h)")

## ------------------------------------------------------------------------
d_q <- rain_dat$get_all_series(variable_name = 'rain_der_qual')
plot(d_q, main="Interpolated rainfall quality code")

## ------------------------------------------------------------------------
rain_dat$close()

ext_data <- system.file('extdata', package='efts')
ens_fcast_file <- file.path(ext_data, 'Upper_Murray_sample_ensemble_rain_fcast.nc')
stopifnot(file.exists(ens_fcast_file))
rain_fct_ens <- open_efts(ens_fcast_file)
rain_fct_ens

## ------------------------------------------------------------------------
all_vars_names <- rain_fct_ens$get_variable_names()
station_ids <- rain_fct_ens$get_values("station_id")
variable_names <- "rain_fcast_ens"
issue_times <- rain_fct_ens$get_time_dim()

## ------------------------------------------------------------------------
ensfcasts = list()
ensfcasts[["1"]] <- rain_fct_ens$get_ensemble_forecasts(variable_names[1], station_ids[1], start_time = issue_times[1])
ensfcasts[["2"]] <- rain_fct_ens$get_ensemble_forecasts(variable_names[1], station_ids[1], start_time = issue_times[2])

## ------------------------------------------------------------------------
demo_efts_plot <- function(index) {
  d <- ensfcasts[[as.character(index)]]
  # TODO: would be nice to have the title retrieved, but not realistic for multivariate files
  dat_desc <- paste("Post Processed Forecasts mm/h",issue_times[index],lubridate::tz(issue_times)) # units: no ylab in plot.xts
  plot(d[,1:3], main=dat_desc)
}

demo_efts_plot(1)

## ------------------------------------------------------------------------
demo_efts_plot(2)
rain_fct_ens$close()

