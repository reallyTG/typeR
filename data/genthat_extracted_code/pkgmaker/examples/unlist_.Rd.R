library(pkgmaker)


### Name: unlist_
### Title: Flatten a List Conserving Names
### Aliases: unlist_

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)

x <- list(A=c(b=-4, 2, b=7), B=3:-1, c(a=1, a=-2), C=list(c(2:-1, d=55), e=99))
unlist(x)
unlist_(x)

# annotation maps (as in AnnotationDbi objects
egids2pbids <- list('10' = 'a', '100' = c('b', 'c'), '1000' = c('d', 'e'))
egids2pbids

unlist(egids2pbids)   # 1001, 1002, 10001 and 10002 are not real
                      # Entrez ids but are the result of unlist()
                      # mangling the names!
unlist_(egids2pbids)  # much cleaner! yes the names are not unique
                      # but at least they are correct...




