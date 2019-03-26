## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("isdparser")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github(c("ropensci/isdparser"))

## ------------------------------------------------------------------------
library("isdparser")

## ------------------------------------------------------------------------
path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
lns <- readLines(path, encoding = "latin1")
isd_parse_line(lns[1])

## ------------------------------------------------------------------------
head(
  isd_parse_line(lns[1], as_data_frame = FALSE)
)

## ------------------------------------------------------------------------
isd_parse_line(lns[1], additional = FALSE)

## ------------------------------------------------------------------------
isd_parse(path)

## ----eval=FALSE----------------------------------------------------------
#  isd_parse(path, parallel = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  isd_parse(path, progress = TRUE)
#  #>
#  #>   |========================================================================================| 100%
#  #> # A tibble: 2,601 × 42
#  #>    total_chars usaf_station wban_station       date  time date_flag latitude longitude type_code
#  #>          <dbl>        <chr>        <chr>     <date> <chr>     <chr>    <dbl>     <dbl>     <chr>
#  #> 1           54       024130        99999 2016-01-01  0000         4    60.75    12.767     FM-12
#  #> 2           54       024130        99999 2016-01-01  0100         4    60.75    12.767     FM-12
#  #> 3           54       024130        99999 2016-01-01  0200         4    60.75    12.767     FM-12
#  #> 4           54       024130        99999 2016-01-01  0300         4    60.75    12.767     FM-12
#  #> 5           54       024130        99999 2016-01-01  0400         4    60.75    12.767     FM-12
#  #> 6           39       024130        99999 2016-01-01  0500         4    60.75    12.767     FM-12
#  #> 7           54       024130        99999 2016-01-01  0600         4    60.75    12.767     FM-12
#  #> 8           39       024130        99999 2016-01-01  0700         4    60.75    12.767     FM-12
#  #> 9           54       024130        99999 2016-01-01  0800         4    60.75    12.767     FM-12
#  #> 10          54       024130        99999 2016-01-01  0900         4    60.75    12.767     FM-12
#  #> # ... with 2,591 more rows, and 33 more variables: elevation <dbl>, call_letter <chr>, quality <chr>,
#  #> #   wind_direction <dbl>, wind_direction_quality <chr>, wind_code <chr>, wind_speed <dbl>,
#  #> #   wind_speed_quality <chr>, ceiling_height <chr>, ceiling_height_quality <chr>,
#  #> #   ceiling_height_determination <chr>, ceiling_height_cavok <chr>, visibility_distance <chr>,
#  #> #   visibility_distance_quality <chr>, visibility_code <chr>, visibility_code_quality <chr>,
#  #> #   temperature <dbl>, temperature_quality <chr>, temperature_dewpoint <dbl>,
#  #> #   temperature_dewpoint_quality <chr>, air_pressure <dbl>, air_pressure_quality <chr>,
#  #> #   AW1_present_weather_observation_identifier <chr>, AW1_automated_atmospheric_condition_code <chr>,
#  #> #   AW1_quality_automated_atmospheric_condition_code <chr>, N03_original_observation <chr>,
#  #> #   N03_original_value_text <chr>, N03_units_code <chr>, N03_parameter_code <chr>, REM_remarks <chr>,
#  #> #   REM_identifier <chr>, REM_length_quantity <chr>, REM_comment <chr>

## ------------------------------------------------------------------------
isd_parse(path, additional = FALSE)

