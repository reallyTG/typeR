library(googleAnalyticsR)


### Name: ga_goal_update
### Title: Updates an existing goal.
### Aliases: ga_goal_update

### ** Examples


## Not run: 
##D 
##D # Change the goal 11 to visits over 3 minutes
##D Goal <- list(
##D   active = TRUE,
##D   name = 'Stayed for more than 3 minutes',
##D   type = 'VISIT_TIME_ON_SITE',
##D   visitTimeOnSiteDetails = list(
##D     comparisonType = 'GREATER_THAN',
##D     comparisonValue = 180
##D   )
##D )
##D ga_goal_update(Goal, accountId, propertyId, viewId, 11)
##D 
##D # Change destination url for goal 17
##D Goal <- list(
##D     urlDestinationDetails = list(
##D       url = '\\/checkout\\/success'
##D     )
##D   )
##D 
##D # Only the fields we're changing required because we're using PATCH method  
##D ga_goal_update(Goal, accountId, propertyId, viewId, 17, method = "PATCH")
##D   
## End(Not run)
  



