library(Smisc)


### Name: stopifnotMsg
### Title: Check multiple conditions and return coresponding error messages
### Aliases: stopifnotMsg

### ** Examples

# A simple function
aFunction <- function(x, a = 10, b = "text") {

  # Check the arguments of the function
  stopifnotMsg(is.numeric(x),   "'x' must be numeric",
               is.numeric(a),   "'a' must be numeric",
               a > 9,           "'a' must be 10 or more",
               is.character(b), "'b' must be character")

  return(paste(x, a, b, sep = " -- "))

}

# This should run without error
aFunction(12, a = 13, b = "new")

## Not run: 
##D # This should produce an error with 3 messages:
##D aFunction("new", a = 7, b = 5)
##D 
##D # And this should produce an error with 1 message:
##D aFunction(33, a = "bad")
## End(Not run)

### This illustrates how the 'level' argument works

# A check function that will be called within another
check <- function(a, lev) {
  stopifnotMsg(is.numeric(a), "a must be numeric", level = lev)
}

# A function that uses the check.
f <- function(a, lev = 1) {
  check(a, lev)
  return(a + 10)
}

## Not run: 
##D # Note how the error is attributed to 'check'
##D f("a")
##D 
##D # But if we change the level to 2, the error will be attributed to 'f'
##D f("a", lev = 2)
## End(Not run)



