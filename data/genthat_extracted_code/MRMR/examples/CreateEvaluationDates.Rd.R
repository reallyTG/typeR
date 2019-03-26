library(MRMR)


### Name: CreateEvaluationDates
### Title: Create triangle evaluation dates
### Aliases: CreateEvaluationDates

### ** Examples

## Not run: 
##D OriginStart = c(mdy("1/1/2000"), mdy("1/1/2000"), mdy("1/1/2001"))
##D OriginEnd = c(mdy("12/31/2000"), mdy("12/31/2000"), mdy("12/31/2001"))
##D OriginPeriod = CreateOriginPeriods(OriginStart, OriginEnd) 
##D DevelopmentLag = c(months(12), months(24), months(12))
##D 
##D EvaluationDates = CreateEvaluationDates(OriginPeriod, DevelopmentLag)
##D EvaluationDates
## End(Not run)




