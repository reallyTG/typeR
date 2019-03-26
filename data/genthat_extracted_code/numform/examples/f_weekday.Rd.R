library(numform)


### Name: f_weekday
### Title: Format Weekdays to One Letter Abbreviation
### Aliases: f_weekday f_weekday.default f_weekday.numeric f_weekday.Date
###   f_weekday.POSIXt f_weekday.hms ff_weekday f_weekday_name
###   f_weekday_name.default f_weekday_name.numeric f_weekday_name.Date
###   f_weekday_name.POSIXt f_weekday_name.hms ff_weekday_name
###   f_weekday_abbreviation f_weekday_abbreviation.default
###   f_weekday_abbreviation.numeric f_weekday_abbreviation.Date
###   f_weekday_abbreviation.POSIXt f_weekday_abbreviation.hms
###   ff_weekday_abbreviation

### ** Examples

f_weekday(weekdays(x=as.Date(seq(7), origin="1950-01-07")))
f_weekday(weekdays(x=as.Date(seq(7), origin="1950-01-07")), TRUE)

f_weekday(1:7)
f_weekday(1:7, TRUE)

days <- seq(as.Date("2000/1/2"), by = "day", length.out = 7)
f_weekday(days)
f_weekday(days, TRUE)

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse)
##D 
##D set.seed(11)
##D data_frame(
##D     date = sample(seq(as.Date("1990/1/1"), by = "day", length.out = 2e4), 12)
##D ) %>%
##D     mutate(
##D         year_4 = f_year(date, 2),
##D         year_2 = f_year(date, 4),
##D         quarter = f_quarter(date),
##D         month_name = f_month_name(date) %>%
##D             as_factor(),
##D         month_abbreviation = f_month_abbreviation(date) %>%
##D             as_factor(),
##D         month_short = f_month(date),
##D         weekday_name = f_weekday_name(date),
##D         weekday_abbreviation = f_weekday_abbreviation(date),
##D        weekday_short = f_weekday(date),
##D         weekday_short_distinct = f_weekday(date, distinct = TRUE)
##D     )
##D 
##D 
##D set.seed(10)
##D dat <- data_frame(
##D     day = sample(weekdays(days), 10000, TRUE),
##D     area =  sample(LETTERS[1:15], 10000, TRUE)
##D ) %>%
##D     count(day, area) %>%
##D     ungroup() %>%
##D     mutate(
##D         day = factor(day, levels = weekdays(days))
##D     )
##D 
##D ## without date formatting
##D ggplot(dat, aes(day, n)) +
##D     geom_bar(stat = 'identity') +
##D     facet_wrap(~area)
##D 
##D ## with date formatting
##D ggplot(dat, aes(day, n)) +
##D     geom_bar(stat = 'identity') +
##D     facet_wrap(~area) +
##D     scale_x_discrete(labels = f_weekday)
##D 
##D ## with date formatting
##D ggplot(dat, aes(day, n)) +
##D     geom_bar(stat = 'identity') +
##D     facet_wrap(~area) +
##D     scale_x_discrete(labels = ff_weekday(distinct = TRUE))
## End(Not run)



