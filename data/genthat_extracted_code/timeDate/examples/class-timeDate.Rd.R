library(timeDate)


### Name: timeDate-class
### Title: Class "timeDate"
### Aliases: timeDate-class
### Keywords: chron

### ** Examples

## Examples for Objects of class 'timeDate':

## timeDate -

   Sys.timeDate()           # direct
   timeDate(Sys.time())     # transformed from "POSIX(c)t"
   
   # Local Time in Zurich
   timeDate(Sys.time(), FinCenter = "Zurich")  

   # Character Vector Strings:
   dts = c("1989-09-28", "2001-01-15", "2004-08-30", "1990-02-09")
   dts
   tms = c(  "23:12:55",   "10:34:02",   "08:30:00",   "11:18:23")
   tms

   t1 <- timeDate(dts, format = "%Y-%m-%d", FinCenter = "GMT" )
   t1
   
   stopifnot(identical(t1, timeDate(dts, FinC = "GMT"))) # auto-format
   
   timeDate(dts, format = "%Y-%m-%d", FinCenter = "Europe/Zurich")
   
   timeDate(paste(dts, tms), format = "%Y-%m-%d %H:%M:%S",
     zone = "GMT", FinCenter = "GMT")
   
   timeDate(paste(dts, tms), 
     zone = "Europe/Zurich", FinCenter = "Europe/Zurich")
   
   timeDate(paste(dts, tms), format = "%Y-%m-%d %H:%M:%S",
     zone = "GMT", FinCenter = "Europe/Zurich")

   ## Non Standard Format:
   timeDate(paste(20:31, "03.2005", sep="."), format = "%d.%m.%Y")

   # Note, ISO and American Formats are Auto-Detected:
   timeDate("2004-12-31", FinCenter = "GMT")
   timeDate("12/11/2004", FinCenter = "GMT")
   timeDate("1/31/2004") # auto-detect American format

   ## ... from POSIX?t, and Using NAs:
   ## lsec <- as.POSIXlt(.leap.seconds) 
   ## lsec[c(2,4:6)] <- NA
   ## timeDate(lsec)

   ## dtms <- paste(dts,tms)
   ## dtms[2:3] <- NA
   ## timeDate(dtms, FinCenter = "Europe/Zurich") # but in GMT



## timeCalendar -
   
   getRmetricsOptions("currentYear")
   timeCalendar() # 12 months of current year
   timeCalendar(m = c(9, 1, 8, 2), d = c(28, 15, 30, 9),
     y = c(1989, 2001, 2004, 1990), FinCenter = "GMT")
   timeCalendar(m = c(9, 1, 8, 2), d = c(28, 15, 30, 9),
     y = c(1989, 2001, 2004, 1990), FinCenter = "Europe/Zurich")
   timeCalendar(h = c(9, 14), min = c(15, 23))

## timeSequence -
   
   timeSequence(from = "2004-03-12", to = "2004-04-11",
     format = "%Y-%m-%d", FinCenter = "GMT")
   timeSequence(from = "2004-03-12", to = "2004-04-11",
     format = "%Y-%m-%d", FinCenter = "Europe/Zurich")

## print | summary | format -

   tC = timeCalendar()
   print(tC)
   summary(tC)
   format(tC)



