library(aweek)


### Name: as.POSIXlt.aweek
### Title: Convert date to a an arbitrary week definition
### Aliases: as.POSIXlt.aweek as.character.aweek date2week print.aweek
###   week2date as.Date.aweek

### ** Examples


# The same set of days will occur in different weeks depending on the start
# date. Here we can define a week before and after today

print(dat <- Sys.Date() + -6:7)

# By default, the weeks are defined as ISO weeks, which start on Monday
print(iso_dat <- date2week(dat))

# If you want lubridate-style numeric-only weeks, you need look no further
# than the "numeric" argument
date2week(dat, 1, numeric = TRUE)

# You can also convert to factor and include all of the missing dates, but
# beware that this may result in a very large factor due to the number of
# levels present
date2week(Sys.Date() + c(0, 10), factor = TRUE)


# The aweek class can be converted back to a date with `as.Date()`
as.Date(iso_dat)

# If you want to show only the first day of the week, you can use the 
# `floor_day` argument
as.Date(iso_dat, floor_day = TRUE)

# This also works with `factor`:
as.Date(iso_dat, floor_day = TRUE, factor = TRUE)

# ISO week definition: Monday -- 1
date2week(dat, 1)
date2week(dat, "Monday")

# Tuesday -- 2
date2week(dat, 2)
date2week(dat, "Tuesday")

# Wednesday -- 3
date2week(dat, 3)
date2week(dat, "W") # you can use valid abbreviations

# Thursday -- 4
date2week(dat, 4)
date2week(dat, "Thursday")

# Friday -- 5
date2week(dat, 5)
date2week(dat, "Friday")

# Saturday -- 6
date2week(dat, 6)
date2week(dat, "Saturday")

# Epiweek definition: Sunday -- 7 
date2week(dat, 7)
date2week(dat, "Sunday")



