library(klausuR)


### Name: compare
### Title: Comparison of data sets
### Aliases: compare
### Keywords: utilities

### ** Examples

## Not run: 
##D data(antworten)
##D 
##D # create some differences
##D antworten2 <- antworten[-3, -7]
##D antworten2[4,6] <- NA
##D antworten2[8,8:10] <- antworten2[8,8:10] + 1
##D 
##D # default comparison
##D compare(antworten, antworten2)
##D 
##D # compare only variables 1 to 12
##D compare(antworten, antworten2, select=c(1:12))
##D 
##D # omit variables 3 to 8 and create a new set called "antworten.comp"
##D # from the results
##D antworten.comp <- compare(antworten, antworten2, select=-c(3:8), new.set=TRUE)
## End(Not run)



