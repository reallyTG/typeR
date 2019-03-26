library(assertr)


### Name: assert
### Title: Raises error if predicate is FALSE in any columns selected
### Aliases: assert assert_

### ** Examples


# returns mtcars
assert(mtcars, not_na, vs)

# return mtcars
assert(mtcars, not_na, mpg:carb)

library(magrittr)                    # for piping operator

mtcars %>%
  assert(in_set(c(0,1)), vs)
  # anything here will run

## Not run: 
##D mtcars %>%
##D   assert(in_set(c(1, 2, 3, 4, 6)), carb)
##D   # the assertion is untrue so
##D   # nothing here will run
## End(Not run)




