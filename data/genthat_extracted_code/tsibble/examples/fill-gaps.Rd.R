library(tsibble)


### Name: fill_gaps
### Title: Turn implicit missing values into explicit missing values
### Aliases: fill_gaps fill_gaps.tbl_ts

### ** Examples

harvest <- tsibble(
  year = c(2010, 2011, 2013, 2011, 2012, 2014),
  fruit = rep(c("kiwi", "cherry"), each = 3),
  kilo = sample(1:10, size = 6),
  key = id(fruit), index = year
)

# gaps as default `NA` ----
fill_gaps(harvest, .full = TRUE)
full_harvest <- fill_gaps(harvest, .full = FALSE)
full_harvest

# use fill() to fill `NA` by previous/next entry
full_harvest %>% 
  group_by(fruit) %>% 
  fill(kilo, .direction = "down")

# replace gaps with a specific value ----
harvest %>%
  fill_gaps(kilo = 0L)

# replace gaps using a function by variable ----
harvest %>%
  fill_gaps(kilo = sum(kilo))

# replace gaps using a function for each group ----
harvest %>%
  group_by(fruit) %>%
  fill_gaps(kilo = sum(kilo))

# leaves existing `NA` untouched ----
harvest[2, 3] <- NA
harvest %>%
  group_by(fruit) %>%
  fill_gaps(kilo = sum(kilo, na.rm = TRUE))

# replace NA ----
pedestrian %>%
  group_by(Sensor) %>%
  fill_gaps(Count = as.integer(median(Count)))



