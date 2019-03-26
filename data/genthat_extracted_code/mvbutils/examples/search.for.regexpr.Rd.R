library(mvbutils)


### Name: search.for.regexpr
### Title: Find functions/objects/flatdoc-documentation containing a
###   regexp.
### Aliases: search.for.regexpr
### Keywords: misc

### ** Examples

## Not run: 
##D # On my own system's ROOT task (i.e. workspace--- see ?cd)
##D search.for.regexpr( 'author', doc=FALSE)
##D # $.GlobalEnv
##D # [1] "cleanup.refs"
##D # the code to function 'cleanup.refs' contains "author"
##D search.for.regexpr( 'author', doc=TRUE)
##D # $.GlobalEnv
##D # [1] "scrunge"
##D # 'scrunge' is a function with a character attribute that contains "author"
##D search.for.regexpr( 'author', doc='p')
##D #$.GlobalEnv
##D # [1] "scrunge" "p1"      "p2"
##D ## 'scrunge' again, plus two character vectors whose names contain 'p'
## End(Not run)



