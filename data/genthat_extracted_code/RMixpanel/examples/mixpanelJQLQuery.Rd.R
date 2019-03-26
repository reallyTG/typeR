library(RMixpanel)


### Name: mixpanelJQLQuery
### Title: Query the Mixpanel JQL API
### Aliases: mixpanelJQLQuery
### Keywords: JQL query mixpanel

### ** Examples

## Not run: 
##D ## Fill in here the API token, key and secret as found on 
##D ## www.mixpanel.com - Account -> Projects. 
##D account = mixpanelCreateAccount("ProjectName",
##D                                 token="c12g3...",
##D                                 secret="168e7e...", 
##D                                 key="543c55...")
##D                                 
##D ## Simple query: number of events for each 'distinct_id'.
##D jqlQuery <- '
##D function main() {
##D   return Events({
##D     from_date: "2016-01-01",
##D     to_date: "2016-12-31"
##D   })
##D   .groupByUser(mixpanel.reducer.count())
##D }'
##D 
##D res <- mixpanelJQLQuery(account, jqlQuery,
##D                         columnNames=c("distinctID", "Count"), toNumeric=2)
##D hist(res$Count)
## End(Not run)


