library(rdfp)


### Name: dfp_createOrders
### Title: OrderService
### Aliases: dfp_createOrders

### ** Examples

## Not run: 
##D request_data <- list('filterStatement'=list('query'="WHERE name = 'TestCompany1'"))
##D dfp_getCompaniesByStatement_result <- dfp_getCompaniesByStatement(request_data) 
##D 
##D request_data <- list(list(name='TestOrder', 
##D                           startDateTime=list(date=list(year=2018, month=12, day=1), 
##D                                              hour=0,
##D                                              minute=0,
##D                                              second=0,
##D                                              timeZoneID='America/New_York'),
##D                           endDateTime=list(date=list(year=2018, month=12, day=31), 
##D                                            hour=23,
##D                                            minute=59,
##D                                            second=59,
##D                                            timeZoneID='America/New_York'), 
##D                           notes='API Test Order', 
##D                           externalOrderId=99999, 
##D                           advertiserId=dfp_getCompaniesByStatement_result$id, 
##D                           traffickerId=dfp_getCurrentUser()$id))
##D dfp_createOrders_result <- dfp_createOrders(request_data)
## End(Not run)



