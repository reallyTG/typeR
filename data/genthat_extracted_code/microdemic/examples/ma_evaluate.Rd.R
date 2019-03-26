library(microdemic)


### Name: ma_evaluate
### Title: Evaluate API
### Aliases: ma_evaluate

### ** Examples

## Not run: 
##D # any numeric value that starts with 19
##D ma_evaluate(query = "Y='19'...")
##D # author name matching, and request certain fields back
##D ma_evaluate(query = "Composite(AA.AuN=='smith')",
##D   atts = c('Id', 'AA.AuN'))
##D # matching year 2010 and request Id and Y fields
##D ma_evaluate(query = "Y=2010", atts = c('Id', 'Y'))
##D # range of years: includes only left boundary value: 2010, 2012
##D ma_evaluate(query = "Y=[2010, 2012)", atts = c('Id', 'Y'))
##D # range by specific dates
##D ma_evaluate(query = "D=['2010-02-03','2010-02-05']", atts = c('Id', 'Y'))
##D # matching author and matching affiliation
##D x <- "Composite(And(AA.AuN='mike smith',AA.AfN='harvard university'))"
##D ma_evaluate(x)
## End(Not run)



