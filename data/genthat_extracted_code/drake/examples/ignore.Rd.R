library(drake)


### Name: ignore
### Title: Ignore components of commands and imported functions.
### Aliases: ignore

### ** Examples

## Not run: 
##D test_with_dir("Contain side effects", {
##D # Normally, `drake` reacts to changes in dependencies.
##D x <- 4
##D make(plan = drake_plan(y = sqrt(x)))
##D x <- 5
##D make(plan = drake_plan(y = sqrt(x)))
##D make(plan = drake_plan(y = sqrt(4) + x))
##D # But not with ignore().
##D make(plan = drake_plan(y = sqrt(4) + ignore(x))) # Builds y.
##D x <- 6
##D make(plan = drake_plan(y = sqrt(4) + ignore(x))) # Skips y.
##D make(plan = drake_plan(y = sqrt(4) + ignore(x + 1))) # Skips y.
##D # What about imported functions?
##D f <- function(x) sqrt(4) + ignore(x + 1)
##D make(plan = drake_plan(x = f(2)))
##D readd(x)
##D f <- function(x) sqrt(4) + ignore(x + 2)
##D make(plan = drake_plan(x = f(2)))
##D readd(x)
##D f <- function(x) sqrt(5) + ignore(x + 2)
##D make(plan = drake_plan(x = f(2)))
##D readd(x)
##D })
## End(Not run)



