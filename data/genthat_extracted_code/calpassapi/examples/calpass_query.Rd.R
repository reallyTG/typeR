library(calpassapi)


### Name: calpass_query
### Title: Query data from CalPASS API endpoints
### Aliases: calpass_query calpass_query_many

### ** Examples

## Not run: 
##D ## get access token
##D cp_token <- calpass_get_token(username='my_cp_api_uid', password='my_cp_api_pwd')
##D 
##D ## single run
##D isk <- calpass_create_isk(first_name='Jane', last_name='Doe'
##D   , gender='F', birthdate=20001231)
##D calpass_query(interSegmentKey=isk
##D   , token=cp_token, endpoint='transcript')
##D calpass_query(interSegmentKey=isk
##D   , token=cp_token, endpoint='placement')
##D 
##D ## multiple
##D firstname <- c('Tom', 'Jane', 'Jo')
##D lastname <- c('Ng', 'Doe', 'Smith')
##D gender <- c('Male', 'Female', 'X')
##D birthdate <- c(20001231, 19990101, 19981111)
##D df <- data.frame(firstname, lastname
##D   , gender, birthdate, stringsAsFactors=FALSE)
##D library(dplyr)
##D df %>%
##D   mutate(isk=calpass_create_isk(first_name=firstname
##D     , last_name=lastname
##D     , gender=gender
##D     , birthdate
##D   )) 
##D dfResults <- calpass_query_many(interSegmentKey=df$isk
##D   , token=cp_token
##D   , endpoint='transcript'
##D )
## End(Not run)



