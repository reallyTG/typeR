library(dostats)


### Name: onarg
### Title: change first argument of a function
### Aliases: onarg

### ** Examples

formals(runif)
onarg(runif, 'max')(1:10, 1)
onarg(runif, 'max')(1:10, 10)
#another version of contains
onarg(`%in%`, 'table')(letters, 'y')



