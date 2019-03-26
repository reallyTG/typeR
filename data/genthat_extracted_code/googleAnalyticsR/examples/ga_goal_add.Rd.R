library(googleAnalyticsR)


### Name: ga_goal_add
### Title: Create a new goal.
### Aliases: ga_goal_add

### ** Examples


## Not run: 
##D 
##D ## Create a Goal object based on destination:
##D Goal <- list(
##D   id = '17',
##D   active = TRUE,
##D   name = 'Checkout',
##D   type = 'URL_DESTINATION',
##D   urlDestinationDetails = list(
##D     url = '\\/checkout\\/thank_you',
##D     matchType = 'REGEX',
##D     caseSensitive = FALSE,
##D     firstStepRequired = FALSE,
##D     steps = list(
##D       list(
##D         number = 1,
##D         name = 'Product',
##D         url = '\\/products\\/'
##D       ),
##D       list(
##D         number = 2,
##D         name = 'Cart',
##D         url = '\\/cart'
##D       ),
##D       list(
##D         number = 3,
##D         name = 'Contact',
##D         url = '\\/checkout\\/contact_information'
##D       ),
##D       list(
##D         number = 4,
##D         name = 'Shipping',
##D         url = '\\/checkout\\/shipping'
##D       ),
##D       list(
##D         number = 5,
##D         name = 'Payment',
##D         url = '\\/checkout\\/payment'
##D       ),
##D       list(
##D         number = 6,
##D         name = 'Processing',
##D         url = '\\/checkout\\/processing'
##D       )
##D     )
##D   )
##D )
##D 
##D ## Create a Goal object based on an event:
##D Goal <- list(
##D   id = '9',
##D   active = TRUE,
##D   name = 'PDF Download',
##D   type = 'EVENT',
##D   eventDetails = list(
##D     useEventValue = TRUE,
##D     eventConditions = list(
##D       list(
##D         type = 'CATEGORY',
##D         matchType = 'EXACT',
##D         expression = 'PDF Download'
##D         ),
##D       list(
##D         type = 'LABEL',
##D         matchType = 'EXACT',
##D         expression = 'January brochure'
##D         )
##D       )
##D     )
##D   )
##D   
##D ## Create a Goal object based on a number of pages visitied in a session:  
##D Goal <- list(
##D   id = '10',
##D   active = TRUE,
##D   name = 'Visited more than 3 pages',
##D   type = 'VISIT_NUM_PAGES',
##D   visitNumPagesDetails = list(
##D     comparisonType = 'GREATER_THAN',
##D     comparisonValue = 3
##D   )
##D )
##D   
##D ## Create a Goal object based on the number of seconds spent on the site  
##D Goal <- list(
##D   id = '11',
##D   active = TRUE,
##D   name = 'Stayed for more than 2 minutes',
##D   type = 'VISIT_TIME_ON_SITE',
##D   visitTimeOnSiteDetails = list(
##D     comparisonType = 'GREATER_THAN',
##D     comparisonValue = 120
##D   )
##D )
## End(Not run)
  



