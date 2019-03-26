library(sugrrants)


### Name: facet_calendar
### Title: Lay out panels in a calendar format
### Aliases: facet_calendar FacetCalendar
### Keywords: datasets

### ** Examples

## No test: 
fs <- pedestrian %>%
  dplyr::filter(Date < as.Date("2016-05-01"))

fs %>%
  ggplot(aes(x = Time, y = Hourly_Counts)) +
  geom_line(aes(colour = Sensor_Name)) +
  facet_calendar(~ Date, nrow = 2) +
  theme(legend.position = "bottom")
## End(No test)



