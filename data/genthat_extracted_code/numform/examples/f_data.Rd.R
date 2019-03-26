library(numform)


### Name: f_data
### Title: Convert and Abbreviate Units of Data.
### Aliases: f_data ff_data f_byte ff_byte f_kilo ff_kilo f_mega ff_mega
###   f_giga ff_giga f_tera ff_tera f_peta ff_peta f_exa ff_exa f_zetta
###   ff_zetta f_yotta ff_yotta

### ** Examples

## Not run: 
##D x <- c(NA, '3', '-', -233456789, -2334567890, 10^(0:10))
##D f_data(x)
##D f_data(x, pad.char = NA)
##D f_data(x, mix.units = TRUE)
##D f_data(x, mix.units = TRUE, binary = TRUE)
##D f_data(x, mix.units = TRUE, binary = TRUE, digits = 2)
##D f_byte(100000000, from = 'GB', binary = TRUE)
##D f_giga(10000000000)
##D f_giga(10000000000, suffix = 'Gb')
##D 
##D library(tidyverse)
##D set.seed(15)
##D dat <- data_frame(
##D     bytes = round(rnorm(7, 1e7, 7.95e6), 0),
##D     days = constant_weekdays %>%
##D         as_factor()
##D )
##D 
##D dat %>%
##D     mutate(
##D         data = f_data(bytes, less.than.replace = TRUE),
##D         weekday = f_weekday(days, distinct = TRUE) %>%
##D             as_factor()
##D     )
##D 
##D dat %>%
##D     mutate(days = days %>% as_factor()) %>%
##D     ggplot(aes(days, bytes, group = 1)) +
##D         geom_line() +
##D         geom_point() +
##D         scale_y_continuous(labels = f_data) +
##D         scale_x_discrete(labels = ff_weekday(distinct = TRUE))
## End(Not run)



