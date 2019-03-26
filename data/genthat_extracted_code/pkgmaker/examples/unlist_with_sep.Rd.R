library(pkgmaker)


### Name: unlist_with_sep
### Title: Flattens All List Levels Using Separated Names
### Aliases: unlist_with_sep

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


x <- list(X = list(a = 1
                   , b = list(b.1 = 2
                              , b.2 = list(b.2.1 = 4, b.2.2 = data.frame())
                              , b.3 = 3)
                   , c = matrix()))
unlist_with_sep(x)
unlist_with_sep(x, '###')




