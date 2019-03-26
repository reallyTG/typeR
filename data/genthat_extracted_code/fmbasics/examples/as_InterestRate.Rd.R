library(fmbasics)


### Name: as_InterestRate
### Title: Coerce to InterestRate
### Aliases: as_InterestRate as_InterestRate.DiscountFactor
###   as_InterestRate.InterestRate

### ** Examples

library("lubridate")
as_InterestRate(DiscountFactor(0.95, ymd(20130101), ymd(20140101)),
  compounding = 2, day_basis = "act/365")
as_InterestRate(InterestRate(c(0.04, 0.05), c(2, 4), 'act/365'),
  compounding = 4, day_basis = 'act/365')



