library(mirt)


### Name: SAT12
### Title: Description of SAT12 data
### Aliases: SAT12
### Keywords: data

### ** Examples


## Not run: 
##D #score the data (missing scored as 0)
##D head(SAT12)
##D data <- key2binary(SAT12,
##D     key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D head(data)
##D 
##D #score the data, missing (value of 8) treated as NA
##D SAT12missing <- SAT12
##D SAT12missing[SAT12missing == 8] <- NA
##D data <- key2binary(SAT12missing,
##D     key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D head(data)
##D 
##D #potentially better scoring for item 32 (based on nominal model finding)
##D data <- key2binary(SAT12,
##D     key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,3))
## End(Not run)



