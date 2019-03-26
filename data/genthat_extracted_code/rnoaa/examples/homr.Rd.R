library(rnoaa)


### Name: homr
### Title: Historical Observing Metadata Repository (HOMR) station metadata
### Aliases: homr

### ** Examples

## Not run: 
##D homr(qid = 'COOP:046742')
##D homr(headersOnly=TRUE, qid='TRANS:')
##D homr(qid = ':046742')
##D homr(qidMod='starts', qid='COOP:0467')
##D homr(headersOnly=TRUE, state='DE')
##D homr(headersOnly=TRUE, country='GHANA')
##D homr(headersOnly=TRUE, state='NC', county='BUNCOMBE')
##D homr(name='CLAYTON')
##D res <- homr(state='NC', county='BUNCOMBE', combine=TRUE)
##D res$id
##D res$head
##D res$updates
##D homr(nameMod='starts', name='CLAY')
##D homr(headersOnly=TRUE, platform='ASOS')
##D homr(qid='COOP:046742', date='2011-01-01')
##D homr(qid='COOP:046742', begindate='2005-01-01', enddate='2011-01-01')
##D homr(state='DE', headersOnly=TRUE)
##D homr(station=20002078)
##D homr(station=20002078, date='all', phrData=FALSE)
##D 
##D # Optionally pass in curl options
##D homr(headersOnly=TRUE, state='NC', county='BUNCOMBE', config=verbose())
## End(Not run)



