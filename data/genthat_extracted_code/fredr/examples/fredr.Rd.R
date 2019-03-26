library(fredr)


### Name: fredr_series_observations
### Title: Get observations of a FRED series
### Aliases: fredr_series_observations fredr

### ** Examples

## No test: 
# Observations for "UNRATE" series between 1980 and 2000.  Units are in terms
# of change from pervious observation.
fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1980-01-01"),
  observation_end = as.Date("2000-01-01"),
  unit = "chg"
)
# All observations for "OILPRICE" series.  The data is first aggregated by
# quarter by taking the average of all observations in the quarter then
# transformed by taking the natural logarithm.
fredr(
  series_id = "OILPRICE",
  frequency = "q",
  aggregation_method = "avg",
  unit = "log"
)

# To retrieve values for multiple series, use purrr's map_dfr() function.

if (requireNamespace("purrr", quietly = TRUE)) {

  library(purrr)
  purrr::map_dfr(c("UNRATE", "OILPRICE"), fredr)

  # Using purrr::pmap_dfr() allows you to use varying optional parameters
  params <- list(
    series_id = c("UNRATE", "OILPRICE"),
    frequency = c("m", "q")
  )

  purrr::pmap_dfr(
    .l = params,
    .f = ~ fredr(series_id = .x, frequency = .y)
  )

}

## End(No test)



