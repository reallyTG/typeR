library(structree)


### Name: structree
### Title: Tree-Structured Clustering
### Aliases: structree print.structree coef.structree

### ** Examples

data(rent)

## Not run: 
##D mod <- structree(nmqm~tr(bez)+tr(bj)+tr(rooms)+badkach,data=rent,
##D                  family=gaussian,stop_criterion="CV")
##D 
##D print(mod)
##D coef(mod)
## End(Not run)




