library(arules)


### Name: LIST
### Title: List Representation for Objects Based on Class itemMatrix
### Aliases: LIST LIST,itemMatrix-method LIST,transactions-method
###   LIST,tidLists-method coerce,ngCMatrix,list-method
### Keywords: manip

### ** Examples

data(Adult)

### default coercions (same as as(Adult[1:5], "list"))
LIST(Adult[1:5])

### coercion without item decoding
LIST(Adult[1:5], decode = FALSE)



