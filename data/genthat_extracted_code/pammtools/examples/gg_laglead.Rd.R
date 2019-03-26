library(pammtools)


### Name: gg_laglead
### Title: Plot Lag-Lead windows
### Aliases: gg_laglead gg_laglead.default gg_laglead.LL_df
###   gg_laglead.nested_fdf

### ** Examples

## Example 1: supply t, tz, ll_fun directly
 gg_laglead(1:10, tz=-5:5,
  ll_fun=function(t, tz) { t >= tz + 2 & t <= tz + 2 + 3})

## Example 2: extract information on t, tz, ll_from data with respective attributes
data("simdf_elra", package = "pammtools")
gg_laglead(simdf_elra)



