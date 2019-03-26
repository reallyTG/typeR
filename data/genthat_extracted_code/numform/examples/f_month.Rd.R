library(numform)


### Name: f_month
### Title: Format Months to One Letter Abbreviation
### Aliases: f_month f_month.default f_month.numeric f_month.Date
###   f_month.POSIXt f_month.hms ff_month f_month_name f_month_name.default
###   f_month_name.numeric f_month_name.Date f_month_name.POSIXt
###   f_month_name.hms ff_month_name f_month_abbreviation
###   f_month_abbreviation.default f_month_abbreviation.numeric
###   f_month_abbreviation.Date f_month_abbreviation.POSIXt
###   f_month_abbreviation.hms ff_month_abbreviation

### ** Examples

f_month(month.name)

f_month(1:12)

dates <- seq(as.Date("2000/1/1"), by = "month", length.out = 12)
f_month(dates)
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
##D     month = sample(month.name, 1000, TRUE),
##D     area =  sample(LETTERS[1:5], 1000, TRUE)
##D ) %>%
##D     count(month, area) %>%
##D     ungroup() %>%
##D     mutate(month = factor(month, levels = constant_months))
##D 
##D ## without date formatting
##D ggplot(dat, aes(month, n)) +
##D     geom_bar(stat = 'identity') +
##D     facet_wrap(~ area)
##D 
##D ## with date formatting
##D ggplot(dat, aes(month, n)) +
##D     geom_bar(stat = 'identity') +
##D     facet_wrap(~ area) +
##D     scale_x_discrete(labels = f_month)
## End(Not run)



