library(taxlist)


### Name: clean
### Title: Clean Orphaned Records
### Aliases: clean clean,taxlist-method
### Keywords: methods

### ** Examples

## No test: 
library(taxlist)
data(Easplist)

## Direct manipulation of slot taxonRelations generates an invalid object
Easplist@taxonRelations <- Easplist@taxonRelations[1:5,]
summary(Easplist)

## Now apply cleaning
Easplist <- clean(Easplist)
summary(Easplist)
## End(No test)



