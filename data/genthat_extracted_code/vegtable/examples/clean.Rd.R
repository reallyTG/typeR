library(vegtable)


### Name: clean
### Title: Clean orphaned records in vegtable object.
### Aliases: clean clean,vegtable-method
### Keywords: methods

### ** Examples

## No test: 
library(vegtable)
data(Kenya_veg)

## Direct manipulation of slot header generates an invalid object
Kenya_veg@header <- Kenya_veg@header[1:50,]
summary(Kenya_veg)

## Now apply cleaning
Kenya_veg <- clean(Kenya_veg)
summary(Kenya_veg)
## End(No test)



