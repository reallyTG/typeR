library(gmDatabase)


### Name: gmExpr
### Title: Creating gmExpressions
### Aliases: gmExpr root
### Keywords: utilities

### ** Examples

expr <- gmExpr(root$project)
## Not run: 
##D gmConnectServer(MySQL(), ...)
##D gmRead(expr$series)
##D 
##D gmRead(expr$series[name=gmTitle, name=drop])
##D ## naming the element gmTitle as name and dropping it in the result
##D 
##D gmRead(expr[pID=id]$series[name=gmTitle, pID=group])
##D ## grouping the series by their corresponding project in the result
## End(Not run)



