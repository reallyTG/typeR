library(berryFunctions)


### Name: tryStack
### Title: try an expression, returning the error stack
### Aliases: tryStack
### Keywords: error programming

### ** Examples


# Functions -----

lower <- function(a) {message("fake message, a = ", a); a+10}
middle <- function(b) {plot(b, main=b) ; warning("fake warning, b = ", b); lower(b) }
upper <- function(c) {cat("printing c:", c, "\n") ; middle(c)}
d <- upper(42)
d
rm(d)


# Classical error management with try -----

## Not run: 
##D  ## intentional error
##D d <- upper("42")                # error, no d creation
##D traceback()                     # calling stack, but only in interactive mode
## End(Not run)

d <- try(upper("42"), silent=TRUE)      # d created
cat(d)                                  # with error message, but no traceback
inherits(d, "try-error")                # use for coding


# way cooler with tryStack -----

d <- tryStack(upper("42") ) # like try, but with traceback, even for warnings
cat(d)
d <- tryStack(upper("42"), silent=TRUE, warn=0) # don't trace warnings
d <- tryStack(upper("42"), short=FALSE)

tryStack(upper(42)) # returns normal output, but warnings are easier to debug
# Note: you can also set options(showWarnCalls=TRUE)

stopifnot(inherits(d, "try-error"))
stopifnot(tryStack(upper(42))==52)

## Not run: 
##D  ## file writing not wanted by CRAN checks
##D d <- tryStack(upper("42"), silent=TRUE, file="log.txt")
##D openFile("log.txt")
##D unlink("log.txt")
## End(Not run)

op <- options(warn=2)
d <- try(upper("42") )
cat(d)
d <- tryStack(upper("42") )
d <- tryStack(upper("42"), warn=FALSE)
cat(d)
options(op) ; rm(op)

# Nested calls -----

f <- function(k) tryStack(upper(k), silent=TRUE)
d <- f(42)                 ; cat("-----\n", d, "\n-----\n") ; rm(d)
d <- f("42")               ; cat("-----\n", d, "\n-----\n") ; rm(d)
d <- tryStack(f(4) )       ; cat("-----\n", d, "\n-----\n") ; rm(d)
# warnings in nested calls are printed twice, unless warn=0
d <- tryStack(f(4), warn=0) # could also be set within 'f'

d <- tryStack(f("4"))      ; cat("-----\n", d, "\n-----\n")
d[1:3] ; rm(d)
# empty stack at begin - because of tryStack in f, no real error happened in f


# Other tests -----

cat( tryStack(upper("42")) )
f <- function(k) tryStack(stop("oh oh"))
d <- f(42) ; cat("-----\n", d, "\n-----\n") ; rm(d) # level 4 not helpful, but OK

# stuff with base::try
f <- function(k) try(upper(k), silent=TRUE)
d <- f(42)     ; cat("-----\n", d, "\n-----\n") ; rm(d)
d <- f("42")   ; cat("-----\n", d, "\n-----\n") ; rm(d) # regular try output

f2 <- function(k) tryStack(f(k), warn=0, silent=TRUE)
d <- f2(42)    ; cat("-----\n", d, "\n-----\n") ; rm(d)
d <- f2("42")  ; cat("-----\n", d, "\n-----\n") ; rm(d) # try -> no error.
# -> Use tryCatch and you can nest those calls. note that d gets longer.





