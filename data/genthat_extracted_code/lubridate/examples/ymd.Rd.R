library(lubridate)


### Name: ymd
### Title: Parse dates with *y*ear, *m*onth, and *d*ay components
### Aliases: ymd ydm mdy myd dmy dym yq
### Keywords: chron

### ** Examples

x <- c("09-01-01", "09-01-02", "09-01-03")
ymd(x)
x <- c("2009-01-01", "2009-01-02", "2009-01-03")
ymd(x)
ymd(090101, 90102)
now() > ymd(20090101)
## TRUE
dmy(010210)
mdy(010210)

## heterogenuous formats in a single vector:
x <- c(20090101, "2009-01-02", "2009 01 03", "2009-1-4",
       "2009-1, 5", "Created on 2009 1 6", "200901 !!! 07")
ymd(x)

## What lubridate might not handle:

## Extremely weird cases when one of the separators is "" and some of the
## formats are not in double digits might not be parsed correctly:
## Not run: 
##D ymd("201002-01", "201002-1", "20102-1")
##D dmy("0312-2010", "312-2010")
## End(Not run)



