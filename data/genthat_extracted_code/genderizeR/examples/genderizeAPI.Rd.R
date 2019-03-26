library(genderizeR)


### Name: genderizeAPI
### Title: Getting data from genderize.io API
### Aliases: genderizeAPI

### ** Examples

## Not run: 
##D 
##D terms = c("loremipsum")
##D genderizeAPI(terms)$response
##D # Null data.table (0 rows and 0 cols)
##D 
##D terms = c("jan", "maria", "norbert", "winston", "loremipsum")
##D genderizeAPI(terms)
##D  
##D # example of the function output 
##D $response
##D       name gender probability count
##D       1:     jan   male        0.60  1692
##D       2:   maria female        0.99  8467
##D       3: norbert   male        1.00    77
##D       4: winston   male        0.98   128
##D 
##D $limitLeft
##D [1] 967
##D 
##D $limit
##D [1] 1000
##D 
##D $limitReset
##D [1] 83234 
##D 
## End(Not run)




