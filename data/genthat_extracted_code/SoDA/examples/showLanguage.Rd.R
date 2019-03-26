library(SoDA)


### Name: showLanguage
### Title: Methods to show the structure of language objects
### Aliases: showLanguage showCall show,language-method
### Keywords: programming

### ** Examples

show(quote(x))

show(as.name("[["))

xx <- quote(f(1:10))

show(xx)

## a call to a function object

f <- function(x)x+1

xx[[1]] <- f

show(xx)

## a literal function expression in the call
## (note: the function definition has not yet been evaluated)

yy <- quote((function(x)x+1)(1:10))

show(yy)




