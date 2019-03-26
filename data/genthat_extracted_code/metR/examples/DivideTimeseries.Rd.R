library(metR)


### Name: DivideTimeseries
### Title: Divides long timeseries for better reading
### Aliases: DivideTimeseries

### ** Examples

library(ggplot2)
library(data.table)
gdata <- geopotential[lat == -30 & lon == 0]
g <- ggplot(gdata, aes(date, gh)) +
    geom_line() +
    geom_smooth() +
    scale_x_date(date_breaks = "1 year", date_labels = "%b")
DivideTimeseries(g, gdata$date, n = 2, "Date", "Max Temperature")



