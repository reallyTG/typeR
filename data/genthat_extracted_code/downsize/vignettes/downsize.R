## ---- eval = F-----------------------------------------------------------
#  big_data <- data.frame(x = rnorm(1e4), y = rnorm(1e4))

## ---- eval = F-----------------------------------------------------------
#  my_data <- downsize(big_data) # downsize(big = big_data)

## ---- eval = F-----------------------------------------------------------
#  library(downsize)
#  test_mode() # scales the workflow appropriately
#  my_mode() # shows if the workflow is in test or production mode
#  big_data <- data.frame(x = rnorm(1e4), y = rnorm(1e4)) # always large
#  my_data <- downsize(big_data) # either large or small
#  nrow(my_data) # responds to test_mode() and production_mode()
#  # ...more code, time-consuming if my_data is large...

## ---- eval = F-----------------------------------------------------------
#  library(downsize)
#  production_mode() # scales the workflow appropriately
#  my_mode() # shows if the workflow is in test or production mode
#  big_data <- data.frame(x = rnorm(1e4), y = rnorm(1e4)) # always large
#  my_data <- downsize(big_data) # either large or small
#  nrow(my_data) # responds to test_mode() and production_mode()
#  # ...more code, time-consuming if my_data is large...

## ------------------------------------------------------------------------
library(downsize)
big_data <- data.frame(x = rnorm(1e4), y = rnorm(1e4))
small_data <- data.frame(x = runif(16), y = runif(16))
test_mode()
my_mode() # getOption("downsize") is TRUE
my_data <- downsize(big_data, small_data) # downsize(big = big_data, small = small_data)
identical(my_data, small_data)

## ------------------------------------------------------------------------
test_mode()
downsize(1:10, length = 2)
m <- matrix(1:36, ncol = 6)
downsize(m, ncol = 2)
downsize(m, nrow = 2)
downsize(m, dim = c(2, 2))
downsize(data.frame(x = 1:10, y = 1:10), nrow = 5)
x = array(0, dim = c(10, 100, 2, 300, 12))
dim(x)
my_array <- downsize(x, dim = rep(3, 5))
dim(my_array)
my_array <- downsize(x, dim = c(1, 4))
dim(my_array)
my_array <- downsize(x, ncol = 1)
dim(my_array)

## ------------------------------------------------------------------------
set.seed(6)
downsize(m, ncol = 2, random = T)

## ------------------------------------------------------------------------
test_mode()
downsize(big = {a = 1; a + 10}, small = {a = 1; a + 1})
production_mode()
downsize(big = {a = 1; a + 10}, small = {a = 1; a + 1})

## ------------------------------------------------------------------------
test_mode()
tmp <- downsize(
  big = {
    x = "long code"
    y = 1000
  }, 
  small = {
    x = "short code"
    y = 3.14
  })
x == "short code" & y == 3.14
production_mode()
tmp <- downsize(
  big = {
    x = "long code"
    y = 1000
  }, 
  small = {
    x = "short code"
    y = 3.14
  })
x == "long code" & y == 1000

