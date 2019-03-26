library(tis)


### Name: ymd
### Title: Extract parts of various Date-Time Objects
### Aliases: ymd ymd.jul ymd.ssDate ymd.ti ymd.default year quarter month
###   day
### Keywords: chron

### ** Examples

ymd()                            ## today's date and time
weekFromNow <- ymd(today() + 7)  ## today() returns a daily ti
year(jul(today()))
month(Sys.time())
## create a monthly tis (Time Indexed Series)
aTis <- tis(0, start = c(2000, 1), end = c(2004, 12), freq = 12)
ymd(ti(aTis))                    ## the yyyymmdd dates of the observations



