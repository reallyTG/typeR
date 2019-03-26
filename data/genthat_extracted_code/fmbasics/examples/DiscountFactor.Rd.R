library(fmbasics)


### Name: DiscountFactor
### Title: DiscountFactor class
### Aliases: DiscountFactor

### ** Examples

library("lubridate")
df <- DiscountFactor(c(0.95, 0.94, 0.93), ymd(20130101), ymd(20140101, 20150101))
as_InterestRate(df, 2, "act/365")



