library(fmbasics)


### Name: InterestRate
### Title: InterestRate class
### Aliases: InterestRate

### ** Examples

library("lubridate")
InterestRate(c(0.04, 0.05), c(2, 4), 'act/365')
rate <- InterestRate(0.04, 2, 'act/365')
as_DiscountFactor(rate, ymd(20140101), ymd(20150101))
as_InterestRate(rate, compounding = 4, day_basis = 'act/365')



