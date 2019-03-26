library(numform)


### Name: f_year
### Title: Format Years
### Aliases: f_year f_year.numeric f_year.Date f_year.POSIXt f_year.hms
###   ff_year

### ** Examples

f_year(as.Date(paste0(1998:2016, '-12-12')))
f_year(c(NA, 1998:2016, 21345))
## Not run: 
##D library(tidyverse)
##D 
##D dat <- data_frame(
##D     year = 1998:2016,
##D     year2 = as.POSIXct(sample(seq_len(1e4), 12), origin = '1970-01-01') +
##D         (365 * 24 * 3600 * seq_len(19)),
##D     val = sample(1:20, length(year), TRUE)
##D ) %>%
##D     mutate(prop = val/sum(val))
##D 
##D dat %>%
##D     ggplot(aes(year, prop)) +
##D         geom_line() +
##D         scale_x_continuous(labels = ff_year(digits = 2), breaks = 1998:2016) +
##D         scale_y_continuous(labels = ff_prop2percent(digits = 0))
##D 
##D dat %>%
##D     ggplot(aes(year2, prop)) +
##D         geom_line() +
##D         scale_x_time(labels = ff_year(digits = 2), breaks = dat$year2) +
##D         scale_y_continuous(labels = ff_prop2percent(digits = 0))
## End(Not run)



