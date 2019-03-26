library(discharge)


### Name: prepareBaseline
### Title: Build baseline signal
### Aliases: prepareBaseline

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# baseline for single run for all the years in input signal
bl.singlerun.all = prepareBaseline(x.streamflow)

# baseline for singlerun between the given start and end years
bl.singlerun.filtered = prepareBaseline(x.streamflow, year.start = 1961, 
                                         year.end = 2000)

# baseline with windowinng and bootstrapping on all years in the input signal
bl.windowed.all = prepareBaseline(x.streamflow, window.20 = TRUE)

# baseline with windowing and bootstrapping on given start year 
#  with end year inferred from singal
bl.windowed.filtered = prepareBaseline(x.streamflow, year.start = 1961, 
                                       window.20 = TRUE)




