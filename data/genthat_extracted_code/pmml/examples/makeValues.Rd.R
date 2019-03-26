library(pmml)


### Name: makeValues
### Title: Create Values element, most likely to add to a DataDictionary
###   element
### Aliases: makeValues

### ** Examples

# define 3 values, none with a 'displayValue' attribute and 1 value 
# defined as 'invalid'. The 2nd one is 'valid' by default.
mv <- makeValues(list(1.1,2.2,3.3),list(NULL,NULL,NULL),
                 list("valid",NULL,"invalid"))



