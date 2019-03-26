library(incidence)


### Name: get_dates
### Title: Retrieve dates from an incidence object
### Aliases: get_dates get_dates.default get_dates.incidence
### Keywords: accessors

### ** Examples


set.seed(999)
dat <- as.Date(Sys.Date()) + sample(-3:50, 100, replace = TRUE)
x <- incidence(dat, interval = "month")
get_dates(x)
get_dates(x, position = "middle")
set.seed(999)
dat <- as.Date(Sys.Date()) + sample(-3:50, 100, replace = TRUE)
x <- incidence(dat, interval = "month")
get_dates(x)
get_dates(x, "center")
get_dates(x, "right")

# Return dates by number of days from the first date
get_dates(x, count_days = TRUE)
get_dates(incidence(-5:5), count_days = TRUE)



