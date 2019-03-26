library(aoos)


### Name: defineRefClass
### Title: Define a Reference Class
### Aliases: defineRefClass

### ** Examples

## Not run: 
##D   vignette("Introduction", "aoos")
## End(Not run)

# Minimal example:
Test <- defineRefClass({
  Class <- "Test" # this is passed as argument to setRefClass
  x <- "character" # all objects which are not functions are fields
  do <- function() cat("Yes, Yes, I'm working...") # a method
})

test <- Test()
test$x <- "a"
test$do()

# Inheritance and privacy:
pTest <- defineRefClass({
  Class <- "pTest"
  # Privacy is solved by inheriting from a class 'Private' which redefines
  # the methods for access.
  contains <- c("Test", "Private") # passed as argument to setRefClass

  .y <- "numeric" # this is going to be 'private'

  doSomething <- function() {
    .self$.y <- 42
    cat(x, .y, "\n")
    invisible(.self)
  }
})

instance <- pTest()
instance$x <- "Value of .y:"
instance$doSomething()

# A notion of privacy:
stopifnot(inherits(try(instance$.y), "try-error"))
stopifnot(inherits(try(instance$.y <- 2), "try-error"))



