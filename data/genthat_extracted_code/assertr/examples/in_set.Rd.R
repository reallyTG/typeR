library(assertr)


### Name: in_set
### Title: Returns TRUE if value in set
### Aliases: in_set

### ** Examples

predicate <- in_set(3,4)
predicate(4)

## is equivalent to

in_set(3,4)(3)

# the remainder of division by 2 is always 0 or 1
rem <- 10 %% 2
in_set(0,1)(rem)

## this is meant to be used as a predicate in an assert statement
assert(mtcars, in_set(3,4,5), gear)

## or in a pipeline, like this was meant for

library(magrittr)

mtcars %>%
  assert(in_set(3,4,5), gear) %>%
  assert(in_set(0,1), vs, am)




