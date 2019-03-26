library(tsbox)


### Name: ts_span
### Title: Limit Time Span
### Aliases: ts_span ts_span ts_start ts_span ts_end

### ** Examples


# use 'anytime' shortcuts
ts_span(mdeaths, start = "1979")       # shortcut for 1979-01-01
ts_span(mdeaths, start = "1979-4")     # shortcut for 1979-04-01
ts_span(mdeaths, start = "197904")     # shortcut for 1979-04-01

# it's fine to use an to date outside of series span
ts_span(mdeaths, end = "2001-01-01")

# use strings to set start or end relative to each other

ts_span(mdeaths, start = "-7 month")   # last 7 months
ts_span(mdeaths, start = -7)           # last 7 periods
ts_span(mdeaths, start = -1)           # last single value
ts_span(mdeaths, end = "1e4 hours")    # first 10000 hours

## No test: 
ts_plot(
  ts_span(mdeaths, start = "-3 years"),
  title = "Three years ago",
  subtitle = "The last three years of available data"
)

ts_ggplot(
  ts_span(mdeaths, end = "28 weeks"),
  title = "28 weeks later",
  subtitle = "The first 28 weeks of available data"
) + theme_tsbox() + scale_color_tsbox()
## End(No test)

# Limit span of 'discoveries' to the same span as 'AirPassengers'
ts_span(discoveries, template = AirPassengers)



