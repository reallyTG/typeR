library(fmbasics)


### Name: as_DiscountFactor
### Title: Coerce to DiscountFactor
### Aliases: as_DiscountFactor as_DiscountFactor.InterestRate

### ** Examples

library("lubridate")
as_DiscountFactor(InterestRate(c(0.04, 0.05), c(2, 4), 'act/365'),
  ymd(20140101), ymd(20150101))



