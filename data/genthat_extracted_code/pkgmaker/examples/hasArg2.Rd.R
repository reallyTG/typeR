library(pkgmaker)


### Name: hasArg2
### Title: Checking for Missing Arguments
### Aliases: hasArg2

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


f <- function(...){ hasArg2('abc') }
f(a=1)
f(abc=1)
f(b=1)




