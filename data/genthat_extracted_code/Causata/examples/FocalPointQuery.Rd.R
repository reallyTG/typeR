library(Causata)


### Name: FocalPointQuery
### Title: Build a focal point query.
### Aliases: FocalPointQuery is.FocalPointQuery
###   as.character.FocalPointQuery
### Keywords: SQL

### ** Examples

# This example builds a query returning a profile at each purchase event 
# with a price greater than $30
query <- FocalPointQuery("purchase") + WithVariables(c("some", "variables")) + 
  Where("purchase-price$Same Session", GreaterThan(30)) + Limit(1000)
as.character(query)



