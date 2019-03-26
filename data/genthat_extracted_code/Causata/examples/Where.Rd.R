library(Causata)


### Name: Where
### Title: Query WHERE clause and comparison operations
### Aliases: Where EqualTo NotEqualTo GreaterThan GreaterThanOrEqualTo
###   LessThan LessThanOrEqualTo Like BeginningWith In
### Keywords: SQL

### ** Examples

q <- FocalPointQuery("page-view") + Where("page-view-count", GreaterThan(10))
q <- FocalPointQuery("page-view") + 
     Where("total-spend", LessThanOrEqualTo(100)) + 
     Where("total-spend", GreaterThan(1))



