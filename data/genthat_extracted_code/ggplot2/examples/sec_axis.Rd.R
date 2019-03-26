library(ggplot2)


### Name: sec_axis
### Title: Specify a secondary axis
### Aliases: sec_axis dup_axis derive

### ** Examples

p <- ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

# Create a simple secondary axis
p + scale_y_continuous(sec.axis = sec_axis(~.+10))

# Inherit the name from the primary axis
p + scale_y_continuous("Miles/gallon", sec.axis = sec_axis(~.+10, name = derive()))

# Duplicate the primary axis
p + scale_y_continuous(sec.axis = dup_axis())

# You can pass in a formula as a shorthand
p + scale_y_continuous(sec.axis = ~.^2)

# Secondary axes work for date and datetime scales too:
df <- data.frame(
  dx = seq(as.POSIXct("2012-02-29 12:00:00",
                       tz = "UTC",
                       format = "%Y-%m-%d %H:%M:%S"
  ),
  length.out = 10, by = "4 hour"
  ),
  price = seq(20, 200000, length.out = 10)
 )

# useful for labelling different time scales in the same plot
ggplot(df, aes(x = dx, y = price)) + geom_line() +
  scale_x_datetime("Date", date_labels = "%b %d",
  date_breaks = "6 hour",
  sec.axis = dup_axis(name = "Time of Day",
  labels = scales::time_format("%I %p")))

# or to transform axes for different timezones
ggplot(df, aes(x = dx, y = price)) + geom_line() +
  scale_x_datetime("GMT", date_labels = "%b %d %I %p",
  sec.axis = sec_axis(~. + 8*3600, name = "GMT+8",
  labels = scales::time_format("%b %d %I %p")))




