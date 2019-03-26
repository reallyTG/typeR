library(tsibble)


### Name: filter_index
### Title: A shorthand for filtering time index for a tsibble
### Aliases: filter_index

### ** Examples

# from the starting time to the end of Feb, 2015
pedestrian %>%
  filter_index(~ "2015-02")

# entire Feb 2015, & from the beginning of Aug 2016 to the end
pedestrian %>%
  filter_index("2015-02", "2016-08" ~ .)

# multiple time windows
pedestrian %>%
  filter_index(~ "2015-02", "2015-08" ~ "2015-09", "2015-12" ~ "2016-02")

# entire 2015
pedestrian %>%
  filter_index("2015")

# specific
pedestrian %>% 
  filter_index("2015-03-23" ~ "2015-10")
pedestrian %>% 
  filter_index("2015-03-23" ~ "2015-10-31")
pedestrian %>% 
  filter_index("2015-03-23 10" ~ "2015-10-31 12")



