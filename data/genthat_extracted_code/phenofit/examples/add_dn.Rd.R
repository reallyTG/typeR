library(phenofit)


### Name: add_dn
### Title: Add n-day flag
### Aliases: add_dn

### ** Examples

date = seq.Date(as.Date("2010-01-01"), as.Date("2010-12-31"), by = "day")
d <- data.frame(date)
dnew <- add_dn(d, days = c(8, 16))



