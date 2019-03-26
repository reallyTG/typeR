library(numform)


### Name: as_factor
### Title: Convert Select 'numform' Outputs to Factor
### Aliases: as_factor

### ** Examples

dat <- structure(list(month1 = c("Jan", "Nov", "Mar", "Jul", "Aug",
"Jan", "Aug", "May", "Dec", "Apr"), month2 = c("March", "May",
"March", "July", "May", "October", "March", "November", "April",
"January"), weekday1 = c("Th", "F", "M", "Su", "Th", "Su", "M",
"Th", "W", "T"), weekday2 = c("We", "Th", "Fr", "Sa", "We", "Su",
"Tu", "Su", "Su", "Th"), weekday3 = c("Sat", "Wed", "Mon", "Wed",
"Wed", "Wed", "Wed", "Sun", "Fri", "Thu"), weekday4 = c("Sunday",
"Sunday", "Thursday", "Saturday", "Monday", "Wednesday", "Friday",
"Thursday", "Sunday", "Saturday")), .Names = c("month1", "month2",
"weekday1", "weekday2", "weekday3", "weekday4"))

as_factor(dat$month1)
as_factor(dat$month2)
as_factor(dat$weekday1)
as_factor(dat$weekday2)
as_factor(dat$weekday3)
as_factor(dat$weekday4)

## shift levels
as_factor(dat$weekday4, -1)
as_factor(dat$weekday4, -2)
as_factor(dat$weekday4, 1)
as_factor(dat$weekday4, 2)

## Not run: 
##D library(tidyverse)
##D 
##D data_frame(
##D     revenue = rnorm(10000, 500000, 50000),
##D     date = sample(seq(as.Date('1999/01/01'), as.Date('2000/01/01'), by="day"), 10000, TRUE),
##D     site = sample(paste("Site", 1:5), 10000, TRUE)
##D ) %>%
##D     mutate(
##D         dollar = f_comma(f_dollar(revenue, digits = -3)),
##D         thous = f_thous(revenue),
##D         thous_dollars = f_thous(revenue, prefix = '$'),
##D         abb_month = f_month(date),
##D         abb_week = as_factor(f_weekday(date, distinct = TRUE))
##D     ) %T>%
##D     print() %>%
##D     ggplot(aes(abb_week, revenue)) +
##D         geom_jitter(width = .2, height = 0, alpha = .2) +
##D         scale_y_continuous(label = ff_thous(prefix = '$'))+
##D         facet_wrap(~site) +
##D         theme_bw()
## End(Not run)



