library(timeDate)


### Name: timeDateMathOps
### Title: timeDate Mathematical Operations
### Aliases: timeDateMathOps Ops,timeDate,timeDate-method
###   +,timeDate,timeDate-method +,timeDate,numeric-method
###   -,timeDate,timeDate-method -,timeDate,numeric-method
###   -,numeric,timeDate-method +,numeric,timeDate-method
### Keywords: chron

### ** Examples

## Create Character Vectors:
   dts = c("1989-09-28", "2001-01-15", "2004-08-30", "1990-02-09")
   dts
   tms = c(  "23:12:55",   "10:34:02",   "08:30:00",   "11:18:23")
   tms
   
## "+/-" - 
   # Add One Day to a Given timeDate Object:
   GMT = timeDate(dts, zone = "GMT", FinCenter = "GMT")
   GMT
   ZUR = timeDate(dts, zone = "GMT", FinCenter = "Europe/Zurich")
   ZUR
   GMT + 24*3600
   ZUR[2] - ZUR[1] 



