library(numform)


### Name: f_quarter
### Title: Format Quarters
### Aliases: f_quarter f_quarter.default f_quarter.numeric f_quarter.Date
###   f_quarter.POSIXt f_quarter.hms ff_quarter

### ** Examples

f_quarter(month.name)

f_quarter(1:12)

dates <- seq(as.Date("2000/1/1"), by = "month", length.out = 12)
f_quarter(dates)
## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse)
##D 
##D set.seed(10)
##D dat <- data_frame(
##D     month = sample(month.name, 1000, TRUE),
##D     area =  sample(LETTERS[1:5], 1000, TRUE)
##D ) %>%
##D     mutate(quarter = factor(f_quarter(month), levels = constant_quarters)) %>%
##D     count(quarter, area)
##D 
##D ggplot(dat, aes(quarter, n)) +
##D     geom_bar(stat = 'identity') +
##D     facet_wrap(~ area)
## End(Not run)



