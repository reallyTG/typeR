library(zoo)


### Name: yearqtr
### Title: An Index Class for Quarterly Data
### Aliases: yearqtr as.yearqtr as.yearqtr.default as.yearqtr.numeric
###   as.yearqtr.integer as.yearqtr.date as.yearqtr.dates as.yearqtr.Date
###   as.yearqtr.timeDate as.yearqtr.jul as.yearqtr.POSIXt
###   as.yearqtr.character as.yearqtr.factor as.yearqtr.yearqtr
###   as.Date.yearqtr as.POSIXct.yearqtr as.POSIXlt.yearqtr as.list.yearqtr
###   as.numeric.yearqtr as.character.yearqtr as.data.frame.yearqtr
###   c.yearqtr cycle.yearqtr format.yearqtr is.numeric.yearqtr
###   mean.yearqtr print.yearqtr range.yearqtr summary.yearqtr
###   unique.yearqtr [.yearqtr [[.yearqtr MATCH.yearqtr Ops.yearqtr
###   Summary.yearqtr Sys.yearqtr -.yearqtr xtfrm.yearqtr
### Keywords: ts

### ** Examples

x <- as.yearqtr(2000 + seq(0, 7)/4)
x

format(x, "%Y Quarter %q")
as.yearqtr("2001 Q2")
as.yearqtr("2001 q2") # same
as.yearqtr("2001-2") # same

# returned Date is the fraction of the way through
# the period given by frac (= 0 by default)
dd <- as.Date(x)
format.yearqtr(dd)
as.Date(x, frac = 1)
as.POSIXct(x)

zz <- zoo(rnorm(8), x, frequency = 4)
zz
as.ts(zz)




