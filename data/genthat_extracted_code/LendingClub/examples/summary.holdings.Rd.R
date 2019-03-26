library(LendingClub)


### Name: summary.holdings
### Title: Prepare a dashboard of key metrics
### Aliases: summary.holdings

### ** Examples

## Not run: 
##D summary( lc_DetailedNotesOwned( LC_CRED ))
##D 
##D # split notes on a variable and  run summary for each subset
##D holdings<- lc_DetailedNotesOwned(LC_CRED)$content
##D x<- lapply(split(holdings, f= holdings$portfolioName), summary)
##D y<- Reduce(function(...) merge(..., by= 'col_labs',  all.x= TRUE), x)
##D names(y)[-1]<- names(x)
##D y
## End(Not run)



