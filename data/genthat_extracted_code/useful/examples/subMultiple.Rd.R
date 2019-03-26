library(useful)


### Name: subVector
### Title: subVector
### Aliases: subVector subMultiple

### ** Examples

theText <- c('Hi Bob & Cooper how is life today', 
'Anything happening now?', 
'Sally & Dave are playing with Jess & Julio | with their kids')
subVector(theText, toSub=c("and"='&', 'or'='\\|'))
subVector(theText)

theText <- c('Hi Bob & Cooper how is life today', 
'Anything happening now?', 
'Sally & Dave are playing with Jess & Julio | with their kids')
subMultiple(theText, pattern=c('&', '\\|'), replacement=c('and', 'or'))




