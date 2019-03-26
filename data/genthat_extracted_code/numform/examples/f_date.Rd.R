library(numform)


### Name: f_date
### Title: Format Dates
### Aliases: f_date ff_date

### ** Examples

f_date(Sys.Date())
f_date(Sys.time())
f_date(Sys.time(), '%b-%y')
set.seed(10)
dates <- as.Date(sample(1:10000, 12), origin = '1970-01-01')
paste(f_date(range(dates)), collapse = ' to ')



