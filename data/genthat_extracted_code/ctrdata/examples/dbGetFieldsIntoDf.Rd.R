library(ctrdata)


### Name: dbGetFieldsIntoDf
### Title: Create data frame by extracting specified fields from database
###   collection
### Aliases: dbGetFieldsIntoDf

### ** Examples


## Not run: 
##D 
##D dbGetFieldsIntoDf("b1_sponsor.b31_and_b32_status_of_the_sponsor")[1,]
##D #                   _id  b1_sponsor.b31_and_b32_status_of_the_sponsor
##D #  1  2004-000015-25-GB                   Non-commercial / Commercial
##D 
##D dbGetFieldsIntoDf("keyword")[1,]
##D #            _id                                           keyword
##D #  1 NCT00129259  T1D / type 1 diabetes / type 1 diabetes mellitus
##D 
## End(Not run)




