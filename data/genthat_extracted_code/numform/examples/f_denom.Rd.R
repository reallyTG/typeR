library(numform)


### Name: f_denom
### Title: Abbreviate Numbers
### Aliases: f_denom ff_denom f_bills ff_bills f_mills ff_mills f_thous
###   ff_thous

### ** Examples

f_denom(c(12345, 12563, 191919), prefix = '$')
f_denom(c(12345, 12563, 191919), prefix = '$', pad.char = '')
f_denom(c(1234365, 122123563, 12913919), prefix = '$')
f_denom(c(12343676215, 122126763563, 1291673919), prefix = '$')
f_denom(c(NA, 2, 12343676215, 122126763563, 1291673919), prefix = '$')
f_denom(c(NA, 2, 123436, 122126763, 1291673919), prefix = '$', mix.denom = TRUE)
f_denom(c(NA, 2, 12343676215, 122126763563, 1291673919), prefix = '$', pad.char = '')
f_denom(c(NA, 2, 12343676215, 122126763563, 1291673919), relative = 1, prefix = '$')
f_denom(c(NA, 2, 12343676215, 122126763563, 1291673919), relative = 9, prefix = '$')
f_denom(c(NA, 2, 12343676215, 122126763563, 1291673919), less.than.replace = TRUE)

f_thous(1234)
f_thous(12345)
f_thous(123456)
f_mills(1234567)
f_mills(12345678)
f_mills(123456789)
f_bills(1234567891)
f_bills(12345678912)
f_bills(123456789123)

f_bills(123456789123, -1) # round to tens
f_bills(123456789123, -2) # round to hundreds
f_bills(123456789123, +1) # round to tenths
f_bills(123456789123, +2) # round to hundreths

x <- c(3886902.8696, 4044584.0424, 6591893.2104, 591893.2104, -3454678)
f_mills(x)
f_mills(x, 1)
f_mills(x, 1, prefix = '$')
f_mills(x, 1, prefix = '$', pad.char = '0')

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse, magrittr)
##D 
##D f_bills(123456789123, -2) %>%
##D     f_prefix("$")
##D 
##D 
##D data_frame(
##D     revenue = rnorm(100, 500000, 50000),
##D     deals = sample(20:50, 100, TRUE)
##D ) %>%
##D     mutate(
##D         dollar = f_dollar(revenue, digits = -3),
##D         thous = f_thous(revenue),
##D         thous_dollars = f_thous(revenue, prefix = '$')
##D     ) %T>%
##D     print() %>%
##D     ggplot(aes(deals, revenue)) +
##D         geom_point() +
##D         geom_smooth() +
##D         scale_y_continuous(label = ff_thous(prefix = '$') )
##D 
##D data_frame(
##D     revenue = rnorm(10000, 500000, 50000),
##D     date = sample(seq(as.Date('1999/01/01'), as.Date('2000/01/01'), by="day"), 10000, TRUE),
##D     site = sample(paste("Site", 1:5), 10000, TRUE)
##D ) %>%
##D     mutate(
##D         dollar = f_dollar(revenue, digits = -3),
##D         thous = f_thous(revenue),
##D         thous_dollars = f_thous(revenue, prefix = '$'),
##D         abb_month = f_month(date),
##D         abb_week = factor(f_weekday(date, distinct = TRUE),
##D         levels = c('Su', 'M', 'T', 'W', 'Th', 'F', 'S'))
##D     ) %T>%
##D     print() %>%
##D     ggplot(aes(abb_week, revenue)) +
##D         geom_jitter(width = .2, height = 0, alpha = .2) +
##D         scale_y_continuous(label = ff_thous(prefix = '$'))+
##D         facet_wrap(~site)
##D 
##D set.seed(10)
##D data_frame(
##D     w = paste(constant_months, rep(2016:2017, each = 12))[1:20] ,
##D     x = rnorm(20, 200000, 75000)
##D ) %>%
##D     {
##D         a <- .
##D         rbind(
##D             a,
##D             a %>%
##D                 mutate(w = 'Total') %>%
##D                 group_by(w) %>%
##D                 summarize(x = sum(x))
##D         )
##D     } %>%
##D     mutate(
##D         y = f_denom(x, prefix = '$'),
##D         z = f_denom(x, mix.denom = TRUE, prefix = '$')
##D     )  %>%
##D     data.frame(stringsAsFactors = FALSE, check.names = FALSE) %>%
##D     pander::pander(split.tables = Inf, justify = alignment(.))
##D 
##D ## Scale with mixed units
##D library(tidyverse)
##D library(numform)
##D 
##D dat <- data_frame(
##D     Value = c(111, 2345, 34567, 456789, 1000001, 1000000001),
##D     Time = 1:6
##D )
##D 
##D ## Uniform units
##D ggplot(dat, aes(Time, Value)) +
##D     geom_line() +
##D     scale_y_continuous(labels = ff_denom( prefix = '$'))
##D 
##D ## Mixed units
##D ggplot(dat, aes(Time, Value)) +
##D     geom_line() +
##D     scale_y_continuous(labels = ff_denom(mix.denom = TRUE, prefix = '$', pad.char = ''))
## End(Not run)



