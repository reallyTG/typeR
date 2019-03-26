library(wakefield)


### Name: date_stamp
### Title: Generate Random Vector of Dates
### Aliases: date_stamp
### Keywords: date

### ** Examples

date_stamp(10)
pie(table(date_stamp(2000, prob = probs(12))))

## Supply dates to `x` to sample from
date_stamp(10, x = seq(as.Date("1980-11-16"), length = 30, by = "1 years"))



