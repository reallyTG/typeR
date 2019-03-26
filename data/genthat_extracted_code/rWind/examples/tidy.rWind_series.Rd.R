library(rWind)


### Name: tidy
### Title: Transforming a rWind_series object into a data.frame
### Aliases: tidy tidy.rWind_series

### ** Examples

data(wind.series)
df <- tidy(wind.series)
head(df)
## Not run: 
##D # use the tidyverse
##D library(dplyr)
##D mean_speed <- tidy(wind.series) %>% group_by(lat, lon) %>%
##D     summarise(speed=mean(speed))
##D wind_average2 <- wind.mean(wind.series)
##D all.equal(wind_average2$speed, mean_speed$speed)
## End(Not run)



