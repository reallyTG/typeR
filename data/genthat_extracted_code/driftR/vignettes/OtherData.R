## ---- eval=FALSE---------------------------------------------------------
#  # A tibble: 1,527 x 11
#          Date     Time  Temp SpCond    pH  pHmV Chloride AmmoniumN NitrateN  Turbidity    DO
#         <chr>    <chr> <dbl>  <dbl> <dbl> <dbl>    <dbl>     <dbl>    <int>      <dbl> <dbl>
#   1 9/18/2015 12:10:49 14.76  0.754  7.18 -36.4    51.22      3.35        0        3.7 92.65
#   2 9/18/2015 12:15:50 14.64  0.750  7.14 -34.1    49.62      6.29        0       -0.2 93.73
#   3 9/18/2015 12:20:51 14.57  0.750  7.14 -33.9    49.75      7.84        0       -0.1 93.95
#   4 9/18/2015 12:25:51 14.51  0.749  7.13 -33.9    50.32      7.67        0       -0.2 93.23
#   5 9/18/2015 12:30:51 14.50  0.749  7.13 -33.6    50.74      7.13        0        0.0 92.74
#   6 9/18/2015 12:35:51 14.63  0.749  7.13 -33.5    50.84      6.49        0        0.0 93.71
#   7 9/18/2015 12:40:51 14.69  0.749  7.13 -33.6    50.66      5.78        0       -0.2 94.56
#   8 9/18/2015 12:45:51 14.66  0.749  7.12 -33.3    50.23      5.32        0       -0.2 94.16
#   9 9/18/2015 12:50:52 14.65  0.749  7.12 -33.3    50.49      4.89        0       -0.2 93.58
#  10 9/18/2015 12:55:51 14.69  0.749  7.12 -33.1    50.04      4.60        0       -0.2 93.80
#  # ... with 1,517 more rows

## ---- eval=FALSE---------------------------------------------------------
#  waterData <- waterData[-1,]

## ---- eval=FALSE---------------------------------------------------------
#  waterData <- waterData[-c(1, 2),]

## ---- eval=FALSE---------------------------------------------------------
#  library(tibble)
#  
#  waterTibble <- as_tibble(waterData)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- rename(waterTibble, date = a.very.long.date.variable.name)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- waterTibble %>%
#    rename(date = a.very.long.date.variable.name) %>%
#    rename(time = a.very.long.time.variable.name)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble$measure <- as.numeric(waterTibble$measure)
#  waterTibble$measure <- as.integer(waterTibble$measure)
#  waterTibble$measure <- as.double(waterTibble$measure)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- waterTibble %>%
#    mutate(temp = as.double(temp)) %>%
#    mutate(pH = as.double(pH)) %>%
#    mutate(NitrateN = as.integer(NitrateN))

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, -c(a.very.long.pH.variable.name, a.very.long.chloride.variable.name))

