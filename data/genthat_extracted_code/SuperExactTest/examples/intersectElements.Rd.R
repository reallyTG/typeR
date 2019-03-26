library(SuperExactTest)


### Name: intersectElements
### Title: Find Intersection Membership
### Aliases: intersectElements

### ** Examples

set.seed(123)
sets=list(S1=sample(letters,10), S2=sample(letters,5), S3=sample(letters,7))
intersectElements(sets,mutual.exclusive=TRUE)
intersectElements(sets,mutual.exclusive=FALSE)



