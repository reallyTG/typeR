library(checkmate)


### Name: checkR6
### Title: Check if an argument is a R6 class
### Aliases: checkR6 check_r6 assertR6 assert_r6 testR6 test_r6 expect_r6

### ** Examples

library(R6)
generator = R6Class("Bar",
  public = list(a = 5),
  private = list(b = 42),
  active = list(c = function() 99)
)
x = generator$new()
checkR6(x, "Bar", cloneable = TRUE, public = "a")



