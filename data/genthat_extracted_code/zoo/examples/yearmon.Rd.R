library(zoo)


### Name: yearmon
### Title: An Index Class for Monthly Data
### Aliases: yearmon as.yearmon as.yearmon.default as.yearmon.numeric
###   as.yearmon.integer as.yearmon.date as.yearmon.dates as.yearmon.Date
###   as.yearmon.timeDate as.yearmon.jul as.yearmon.POSIXt
###   as.yearmon.character as.yearmon.date as.yearmon.factor as.Date
###   as.Date.numeric as.Date.ts as.Date.yearmon as.POSIXct.yearmon
###   as.POSIXlt.yearmon as.list.yearmon as.numeric.yearmon
###   as.character.yearmon as.data.frame.yearmon c.yearmon cycle.yearmon
###   format.yearmon is.numeric.yearmon mean.yearmon print.yearmon
###   range.yearmon summary.yearmon unique.yearmon [.yearmon [[.yearmon
###   MATCH.yearmon Ops.yearmon Summary.yearmon Sys.yearmon -.yearmon
###   xtfrm.yearmon
### Keywords: ts

### ** Examples

x <- as.yearmon(2000 + seq(0, 23)/12)
x

as.yearmon("mar07", "%b%y")
as.yearmon("2007-03-01")
as.yearmon("2007-12")

# returned Date is the fraction of the way through
# the period given by frac (= 0 by default)
as.Date(x)
as.Date(x, frac = 1)
as.POSIXct(x)

# given a Date, x, return the Date of the next Friday
nextfri <- function(x) 7 * ceiling(as.numeric(x - 1)/7) + as.Date(1)

# given a Date, d, return the same Date in the following month
# Note that as.Date.yearmon gives first Date of the month.
d <- as.Date("2005-1-1") + seq(0,90,30)
next.month <- function(d) as.Date(as.yearmon(d) + 1/12) + 
	as.numeric(d - as.Date(as.yearmon(d)))
next.month(d)

# 3rd Friday in last month of the quarter of Date x
as.Date(as.yearmon(as.yearqtr(x)) + 2/12) + 14

z <- zoo(rnorm(24), x, frequency = 12)
z
as.ts(z)

## convert data fram to multivariate monthly "ts" series
## 1.read raw data
Lines.raw <- "ID Date Count
123 20 May 1999 1
123 21 May 1999 3
222 1 Feb 2000 2
222 3 Feb 2000 4
"
DF <- read.table(text = Lines.raw, skip = 1,
 col.names = c("ID", "d", "b", "Y", "Count"))
## 2. fix raw date
DF$yearmon <- as.yearmon(paste(DF$b, DF$Y), "%b %Y")
## 3. aggregate counts over months, convert to zoo and merge over IDs
ag <- function(DF) aggregate(zoo(DF$Count), DF$yearmon, sum)
z <- do.call("merge.zoo", lapply(split(DF, DF$ID), ag))
## 4. convert to "zooreg" and then to "ts"
frequency(z) <- 12
as.ts(z)

xx <- zoo(seq_along(x), x)

## aggregating over year 
as.year <- function(x) as.numeric(floor(as.yearmon(x)))
aggregate(xx, as.year, mean)




