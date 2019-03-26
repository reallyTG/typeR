library(vamc)


### Name: genPortInception
### Title: Generate a portfolio of VA contracts at inception based on given
###   attribute ranges and investment fund information.
### Aliases: genPortInception

### ** Examples

genPortInception()
genPortInception(c("1980-01-01", "1990-01-01"), c("2001-08-01", "2014-01-01"),
c(15, 30), c(5e4, 5e5), 0.4, c(30, 50, 60, 80, 10, 38, 45, 55, 47, 46),
200, rep(1 / 4, 4), c("WBRP", "WBRU", "WBSU", "DBWB"),
riderFee = c(25, 35, 35, 50), rep(5, 4), rep(5, 4), 100)



