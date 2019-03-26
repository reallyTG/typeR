library(tsibble)


### Name: time_in
### Title: If time falls in the ranges using compact expressions
### Aliases: time_in

### ** Examples

x <- unique(pedestrian$Date_Time)
lgl <- time_in(x, ~ "2015-02", "2015-08" ~ "2015-09", "2015-12" ~ "2016-02")
lgl[1:10]
# more specific
lgl2 <- time_in(x, "2015-03-23 10" ~ "2015-10-31 12")
lgl2[1:10]

pedestrian %>% 
  filter(time_in(Date_Time, "2015-03-23 10" ~ "2015-10-31 12"))
pedestrian %>% 
  filter(time_in(Date_Time, "2015")) %>% 
  mutate(Season = ifelse(
    time_in(Date_Time, "2015-03" ~ "2015-08"),
    "Autumn-Winter", "Spring-Summer"
  ))



