library(echarts4r)


### Name: e_calendar
### Title: Calendar
### Aliases: e_calendar

### ** Examples

# year
mtcars %>% 
  e_charts() %>% 
  e_calendar(range = "2017")
  
# month
mtcars %>% 
  e_charts() %>% 
  e_calendar(range = "2018-01")
  
# range
mtcars %>% 
  e_charts() %>% 
  e_calendar(range = c("2018-01", "2018-07"))




