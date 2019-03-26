library(pkgcond)


### Name: find_scope
### Title: Find the default scope of a call.
### Aliases: find_scope

### ** Examples


my_function <- function(){
    scope <- find_scope()
    "You are in" %<<% collapse(scope, '::')
}
my_function()

my_sights <- my_function
my_sights()




