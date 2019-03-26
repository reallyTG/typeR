library(padr)


### Name: span_date
### Title: Wrapper around 'seq.Date'.
### Aliases: span_date

### ** Examples

# using "to" argument
span_date(2011, 2015)
span_date(201101, 201501)
span_date(2011, 2015, by = "month")
span_date(2011, 201501)
span_date(20111225, 2012)

# using "len_out" argument
span_date(2011, len_out = 4)
span_date(201101, len_out = 4)
span_date(20110101, len_out = 4)
span_date(20110101, len_out = 4, by = "month")



