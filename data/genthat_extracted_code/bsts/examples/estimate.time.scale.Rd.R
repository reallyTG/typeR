library(bsts)


### Name: estimate.time.scale
### Title: Intervals between dates
### Aliases: EstimateTimeScale
### Keywords: chron

### ** Examples

weekly.data <- as.Date(c("2011-10-01",
                         "2011-10-08",
                         "2011-10-15",
                         "2011-10-22",
                         "2011-10-29",
                         "2011-11-05"))

EstimateTimeScale(weekly.data) # "weekly"

almost.weekly.data <- as.Date(c("2011-10-01",
                                "2011-10-08",
                                "2011-10-15",
                                "2011-10-22",
                                "2011-10-29",
                                "2011-11-06"))  # last day is one later

EstimateTimeScale(weekly.data) # "other"



