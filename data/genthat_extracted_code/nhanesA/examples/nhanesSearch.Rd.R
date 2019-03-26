library(nhanesA)


### Name: nhanesSearch
### Title: Perform a search over the comprehensive NHANES variable list.
### Aliases: nhanesSearch

### ** Examples

 ## No test: 
nhanesSearch("bladder", ystart=2001, ystop=2008, nchar=50)
## End(No test)
 ## No test: 
nhanesSearch("urin", exclude_terms="During", ystart=2009)
## End(No test)
 ## No test: 
nhanesSearch(c("urine", "urinary"), ignore.case=TRUE, ystop=2006, namesonly=TRUE)
## End(No test)



