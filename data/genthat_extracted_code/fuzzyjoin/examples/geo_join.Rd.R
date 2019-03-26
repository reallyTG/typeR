library(fuzzyjoin)


### Name: geo_join
### Title: Join two tables based on a geo distance of longitudes and
###   latitudes
### Aliases: geo_join geo_inner_join geo_left_join geo_right_join
###   geo_full_join geo_semi_join geo_anti_join

### ** Examples


library(dplyr)
data("state")

# find pairs of US states whose centers are within
# 200 miles of each other
states <- data_frame(state = state.name,
                     longitude = state.center$x,
                     latitude = state.center$y)

s1 <- rename(states, state1 = state)
s2 <- rename(states, state2 = state)

pairs <- s1 %>%
 geo_inner_join(s2, max_dist = 200) %>%
 filter(state1 != state2)

pairs

# plot them
library(ggplot2)
ggplot(pairs, aes(x = longitude.x, y = latitude.x,
                  xend = longitude.y, yend = latitude.y)) +
  geom_segment(color = "red") +
  borders("state") +
  theme_void()

# also get distances
s1 %>%
  geo_inner_join(s2, max_dist = 200, distance_col = "distance")




