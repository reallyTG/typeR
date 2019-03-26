library(naniar)


### Name: oceanbuoys
### Title: West Pacific Tropical Atmosphere Ocean Data, 1993 & 1997.
### Aliases: oceanbuoys
### Keywords: datasets

### ** Examples


# explore the missingness with vis_miss
library(naniar)

vis_miss(oceanbuoys)

# Look at the missingness in the variables
miss_var_summary(oceanbuoys)

# Look at the missingness in air temperature and humidity
library(ggplot2)
p <-
ggplot(oceanbuoys,
       aes(x = air_temp_c,
           y = humidity)) +
     geom_miss_point()

 p

 # for each year?
 p + facet_wrap(~year)

 # this shows that there are more missing values in humidity in 1993, and
 # more air temperature missing values in 1997

 # what if we explore the value of air temperature and humidity based on
 # the missingness of each

 oceanbuoys %>%
   bind_shadow() %>%
   ggplot(aes(x = air_temp_c,
              fill = humidity_NA)) +
       geom_histogram()

 oceanbuoys %>%
   bind_shadow() %>%
   ggplot(aes(x = humidity,
              fill = air_temp_c_NA)) +
       geom_histogram()




