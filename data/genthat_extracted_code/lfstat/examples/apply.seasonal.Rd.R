library(lfstat)


### Name: apply.seasonal
### Title: Apply an aggregation function seasonally.
### Aliases: apply.seasonal

### ** Examples

 data(ngaruroro)
 ng <- as.xts(ngaruroro)

 year <- water_year(time(ng), origin = "Sept")
 ng10 <- ng[year %in% 1991:2000, ]

 # computes the annual minima (AM)
 apply.seasonal(ng10, varying = "yearly", origin = 9)

 # computes the mean annual minima (MAM)
 apply.seasonal(ng10, varying = "yearly", aggregate = mean, origin = 9)

 # computes monthly minima (AM)
 apply.seasonal(ng10, varying = "monthly", origin = 9)

 # computes minima for summer and winter separately
 # winter starts in September
 seasons <- as.Date(c("1999-09-01", "1999-11-04"))
 names(seasons) <- c("winter", "summer")
 apply.seasonal(ng10$discharge, varying = seasons, origin = 9)



