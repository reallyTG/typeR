library(pkgmaker)


### Name: expand_list
### Title: Expanding Lists
### Aliases: expand_list expand_dots

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


expand_list(list(a=1, b=2), c=3)
expand_list(list(a=1, b=2, c=4), c=3)
# with a list
expand_list(list(a=1, b=2), list(c=3, d=10))
# no partial match
expand_list(list(a=1, b=2, c=5), cd=3)
# partial match with names expanded
expand_list(list(a=1, b=2, c=5), cd=3, .exact=FALSE)
# partial match without expanding names
expand_list(list(a=1, b=2, c=5), cd=3, .exact=FALSE, .names=FALSE)

# works also inside a function to expand a call with default arguments
f <- function(...){
	cl  <- match.call()
	expand_list(cl, list(a=3, b=4), .exact=FALSE)
}
f()
f(c=1)
f(a=2)
f(c=1, a=2)

# expanding dot arguments

f <- function(...){ 
	expand_dots(list(a=2, bcd='a', xxx=20), .exclude='xxx') 
}

# add default value for all arguments 
f()
# add default value for `bcd` only
f(a=10)
# expand names
f(a=10, b=4)




