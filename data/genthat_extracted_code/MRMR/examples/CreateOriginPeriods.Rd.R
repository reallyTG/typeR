library(MRMR)


### Name: CreateOriginPeriods
### Title: CreateOriginPeriods
### Aliases: CreateOriginPeriods

### ** Examples

## Not run: 
##D # Case 1
##D library(lubridate)
##D OriginStart = c(mdy("1/1/2000"), mdy("1/1/2000"), mdy("1/1/2001"))
##D OriginEnd = c(mdy("12/31/2000"), mdy("12/31/2000"), mdy("12/31/2001"))
##D 
##D OriginPeriods = CreateOriginPeriods(OriginStart, OriginEnd)
##D OriginPeriods
##D 
##D # Case 2
##D OriginStart = c(mdy("1/1/2000"), mdy("1/1/2000"), mdy("1/1/2001"))
##D OriginPeriods = CreateOriginPeriods(OriginStart, OriginLength = months(12))
##D OriginPeriods
##D 
##D # Case 3
##D OriginStartYear = c(2000, 2000, 2001)
##D OriginPeriods = CreateOriginPeriods(OriginStartYear, OriginLength = years(1)
##D                                      , StartDay = 1, StartMonth = 1)
##D OriginPeriods
## End(Not run)




