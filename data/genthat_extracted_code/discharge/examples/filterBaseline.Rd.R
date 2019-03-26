library(discharge)


### Name: filterBaseline
### Title: Filter the baseline signal for a given time window
### Aliases: filterBaseline

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# baseline for single run for all the years in input signal
x.bl = prepareBaseline(x.streamflow)

# filter the baseline signal between years 1993 and 2000
x.bl.filtered = filterBaseline(x.bl, filter.date.start = "1993-01-01",
                               filter.date.end = "2000-12-31")




