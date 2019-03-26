library(numform)


### Name: f_12_hour
### Title: Format 12 Hour Times
### Aliases: f_12_hour f_12_hour.default f_12_hour.integer
###   f_12_hour.numeric f_12_hour.hms ff_12_hour

### ** Examples

f_12_hour(Sys.time())
f_12_hour(Sys.time(), pad.char ='0')
f_12_hour(Sys.time(), pad.char =' ')
f_12_hour(Sys.time(), '%I:%M:%S %p')
f_12_hour(c(NA, 0:24), '%I %p')
set.seed(10)
times <- as.POSIXct(sample(seq_len(1e4), 12), origin = '1970-01-01')
paste(f_12_hour(range(times)), collapse = ' to ')
## Not run: 
##D library(tidyverse)
##D 
##D set.seed(10)
##D data_frame(
##D     time = as.POSIXct(sample(seq_len(1e4), 12), origin = '1970-01-01'),
##D     val = sample(1:20, length(time), TRUE)
##D ) %>%
##D     mutate(prop = val/sum(val)) %>%
##D     ggplot(aes(time, prop)) +
##D         geom_line() +
##D         scale_x_time(labels = ff_12_hour(format = '%I %p')) +
##D         scale_y_continuous(labels = ff_prop2percent(digits = 0))
## End(Not run)



