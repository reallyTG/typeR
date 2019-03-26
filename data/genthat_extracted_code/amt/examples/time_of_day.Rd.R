library(amt)


### Name: time_of_day
### Title: Time of the day when a fix was taken
### Aliases: time_of_day time_of_day.track_xyt time_of_day.steps_xyt

### ** Examples

data(deer)
deer %>% time_of_day()
deer %>% steps_by_burst %>% time_of_day()
deer %>% steps_by_burst %>% time_of_day(where = "start")
deer %>% steps_by_burst %>% time_of_day(where = "end")
deer %>% steps_by_burst %>% time_of_day(where = "both")




