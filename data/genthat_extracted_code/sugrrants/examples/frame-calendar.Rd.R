library(sugrrants)


### Name: frame_calendar
### Title: Rearrange a temporal data frame to a calendar-based data format
###   using linear algebra
### Aliases: frame_calendar prettify

### ** Examples

library(dplyr)
# compute the calendar layout for the data frame
calendar_df <- pedestrian %>%
  filter(Sensor_ID == 13, Year == 2016) %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, nrow = 4)

# ggplot
p1 <- calendar_df %>%
  ggplot(aes(x = .Time, y = .Hourly_Counts, group = Date)) +
  geom_line()
prettify(p1, size = 3, label.padding = unit(0.15, "lines"))

# use in conjunction with group_by()
grped_calendar <- pedestrian %>%
  filter(Year == "2017", Month == "March") %>%
  group_by(Sensor_Name) %>%
  frame_calendar(x = Time, y = Hourly_Counts, date = Date, sunday = TRUE)

p2 <- grped_calendar %>%
  ggplot(aes(x = .Time, y = .Hourly_Counts, group = Date)) +
  geom_line() +
  facet_wrap(~ Sensor_Name, nrow = 2)
prettify(p2)
## Not run: 
##D # allow for different languages
##D # below gives simplied Chinese labels with STKaiti font family,
##D # assuming this font installed in user's local system
##D prettify(p2, locale = "zh", family = "STKaiti")
##D 
##D # plotly example
##D if (!requireNamespace("plotly", quietly = TRUE)) {
##D   stop("Please install the 'plotly' package to run these following examples.")
##D }
##D library(plotly)
##D pp <- calendar_df %>% 
##D   group_by(Date) %>%
##D   plot_ly(x = ~ .Time, y = ~ .Hourly_Counts) %>%
##D   add_lines(text = ~ paste("Count: ", Hourly_Counts, "<br> Time: ", Time))
##D prettify(pp)
## End(Not run)




