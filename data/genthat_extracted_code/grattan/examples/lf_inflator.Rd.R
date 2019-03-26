library(grattan)


### Name: lf_inflator
### Title: Labour force inflators
### Aliases: lf_inflator lf_inflator_fy

### ** Examples

lf_inflator_fy(labour_force = 1, from_fy = "2012-13", to_fy = "2013-14")

library(data.table)
# Custom 1% growth over 2018-19 -> 2019-20
lf_inflator_fy(from_fy = "2018-19",
               to_fy = "2019-20",
               forecast.series = "custom", 
               lf.series = data.table(fy_year = c("2018-19", "2019-20"),
                                      r = c(0, 0.01)))
## Not run: 
##D lf_inflator(labour_force = 1, from_date = "2013-06-30", to_date = "2014-06-30")
## End(Not run)



