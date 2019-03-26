library(recipes)


### Name: step_geodist
### Title: Distance between two locations
### Aliases: step_geodist tidy.step_geodist
### Keywords: datagen

### ** Examples


data(Smithsonian)

# How close are the museums to Union Station?
near_station <- recipe( ~ ., data = Smithsonian) %>%
  update_role(name, new_role = "location") %>%
  step_geodist(lat = latitude, lon = longitude, log = FALSE,
               ref_lat = 38.8986312, ref_lon = -77.0062457) %>%
  prep(training = Smithsonian, retain = TRUE)

juice(near_station) %>%
  arrange(geo_dist)

tidy(near_station, number = 1)



