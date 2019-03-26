library(padr)


### Name: subset_span
### Title: Subset a spanned datetime vector
### Aliases: subset_span

### ** Examples

date_span <- span_date(20170701, len_out = 100)
subset_span(date_span, list(wday = 1:5))

time_span <- span_time("20170101 00", 201702)
subset_span(time_span, list(hour = 7:17))
subset_span(time_span, list(hour = c(10, 16), mday = seq(5, 30, 5)))



