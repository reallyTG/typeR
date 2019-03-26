library(TimeWarp)


### Name: dateWarp
### Title: Date vector shifting and alignment
### Aliases: dateWarp dateWarpAppend
### Keywords: utilities

### ** Examples

library(Holidays)
dates <- dateSeq("2001/12/20", by = 'bizdays', len = 9, holidays = "NYSEC")
dateWarp(dates, -1:1, by = "bizdays", holidays = "NYSEC", duplicates.keep = FALSE)
dateWarp(dates, "+1 bizdays@NYSEC")
dateWarp(dates, list(0:6), by = "bizdays@NYSEC")
dateWarp(dates, list(-1:1, unique = TRUE), by = "bizdays")
dateWarp(dates, list(latest = "2001/12/25"))
x <- dateSeq("2001/01/01", len = 4, by = "weeks")
dateWarp(dates, list(align = list(to = x, how = "after")))
dateWarp(dates, list(shift = list(by = "bizdays", k.by = 2, direction = 1, holidays = "NYSEC"),
                     shift = 2),
         by = "days", direction = -1,
holidays = "NONE")
dateWarp(dates, hol = "NYSEC",
         list(shift = list(k.by = 1, by = "months"),
         shift=list(k.by = -1, by = "bizdays")))
dateWarp(dates, list(align = list(by = "bizdays"),
                     shift = list(by = "months", k.by = 2), holidays = "JPNEX"))

# Options expirations dates in 2008
(d1 <- dateSeq('2008-01-01', len=12, by='months'))
(d2 <- dateAlign(d1, by='months', dir=-1))
(d3 <- dateAlign(d2, by='weeks', week.align=5))
(d4 <- dateWarp(d3, 14, by='days'))
(d5 <- dateAlign(d4, by='bizdays@NYSEC', dir=-1))
# Version that uses a list 'spec' to dateWarp
dateWarp(d1, list(align=list(by='months', dir=-1),
                  align=list(by='weeks', week.align=5),
                  shift=list(by='days', 14),
                  align=list(by='bizdays@NYSEC', dir=-1)))
# In 2008 the March options expiration is a Thursday because Friday was a holiday
dateDow(d5)



