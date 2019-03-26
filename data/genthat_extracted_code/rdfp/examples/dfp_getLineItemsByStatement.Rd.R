library(rdfp)


### Name: dfp_getLineItemsByStatement
### Title: getLineItemsByStatement
### Aliases: dfp_getLineItemsByStatement

### ** Examples

## Not run: 
##D filter <- "WHERE LineItemType='STANDARD' and Status='DELIVERING' LIMIT 10"
##D result <- dfp_getLineItemsByStatement(list(filterStatement=list(query=filter)))
## End(Not run)



