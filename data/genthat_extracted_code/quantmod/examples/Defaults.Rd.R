library(quantmod)


### Name: Defaults
### Title: Manage Default Argument Values for quantmod Functions
### Aliases: importDefaults getDefaults setDefaults unsetDefaults
### Keywords: utilities

### ** Examples

my.fun <- function(x=3)
{
  importDefaults('my.fun')
  x^2
}

my.fun()        # returns 9

setDefaults(my.fun, x=10)
my.fun()        # returns 100
my.fun(x=4)     # returns 16

getDefaults(my.fun)
formals(my.fun)
unsetDefaults(my.fun, confirm=FALSE)
getDefaults(my.fun)

my.fun()        # returns 9



