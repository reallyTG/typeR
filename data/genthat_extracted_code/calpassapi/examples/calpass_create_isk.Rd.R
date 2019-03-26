library(calpassapi)


### Name: calpass_create_isk
### Title: Create interSegmentKey's for students
### Aliases: calpass_create_isk

### ** Examples

## single
calpass_create_isk(first_name='Jane', last_name='Doe'
 , gender='F', birthdate=20001231)
## data frame
## Not run: 
##D firstname <- c('Tom', 'Jane', 'Jo')
##D lastname <- c('Ng', 'Doe', 'Smith')
##D gender <- c('Male', 'Female', 'X')
##D birthdate <- c(2001231, 19990101, 19981111)
##D df <- data.frame(firstname, lastname
##D   , gender, birthdate, stringsAsFactors=FALSE)
##D library(dplyr)
##D df %>%
##D   mutate(isk=calpass_create_isk(first_name=firstname
##D     , last_name=lastname
##D     , gender=gender
##D     , birthdate
##D   ))
## End(Not run)



