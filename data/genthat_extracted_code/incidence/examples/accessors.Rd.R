library(incidence)


### Name: dim.incidence
### Title: Access various elements of an incidence object
### Aliases: dim.incidence get_interval get_interval.default
###   get_interval.incidence get_n get_n.default get_n.incidence
###   get_timespan get_timespan.default get_timespan.incidence
### Keywords: accessors

### ** Examples


set.seed(999)
dat <- as.Date(Sys.Date()) + sample(-3:50, 100, replace = TRUE)
x <- incidence(dat, interval = "month")

# the value stored in the interval element
get_interval(x)

# the numeric value of the interval in days
get_interval(x, integer = FALSE)

# the number of observations in the object
get_n(x)

# the length of time represented
get_timespan(x)

# the number of groups
ncol(x)

# the number of bins (intervals)
nrow(x)



