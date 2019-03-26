library(pammtools)


### Name: get_laglead
### Title: Construct or extract data that represents a lag-lead window
### Aliases: get_laglead get_laglead.default get_laglead.data.frame

### ** Examples

get_laglead(0:10, tz=-5:5, ll_fun=function(t, tz) { t >= tz + 2 & t <= tz + 2 + 3})
gg_laglead(0:10, tz=-5:5, ll_fun=function(t, tz) { t >= tz + 2 & t <= tz + 2 + 3})



