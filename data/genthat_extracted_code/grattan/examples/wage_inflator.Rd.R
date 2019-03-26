library(grattan)


### Name: wage_inflator
### Title: Inflation using the Wage Price Index.
### Aliases: wage_inflator

### ** Examples

# Wage inflation
wage_inflator(from_fy = "2013-14", to_fy = "2014-15")

# Custom wage inflation
wage_inflator(from_fy = "2016-17",
              to_fy = "2017-18",
              forecast.series = "custom",
              wage.series = 0.05)





