library(simecol)


### Name: addtoenv
### Title: Add Functions from a Non-nested List of Named Functions to a
###   Common Environment
### Aliases: addtoenv
### Keywords: programming environment

### ** Examples

eq <- list(f1 = function(x, y)    x + y,
           f2 = function(a, x, y) a * f1(x, y)
          )

fx <- function(eq) {
  eq <- addtoenv(eq)
  print(ls())
  print(environment(eq$f1))
  f1(3,4) + f2(1,2,3)
}

fx(eq)
## eq$f2(2,3,4)       # should give an error outside fx
environment(eq$f2)    # should return R_GlobalEnv again



