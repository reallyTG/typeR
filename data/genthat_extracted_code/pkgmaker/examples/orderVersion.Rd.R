library(pkgmaker)


### Name: orderVersion
### Title: Ordering Version Numbers
### Aliases: orderVersion sortVersion

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


v <- c('1.0', '1.03', '1.2')
order(v)
orderVersion(v)


sort(v)
sortVersion(v)



