library(SnakeCharmR)


### Name: py.exec
### Title: Executes arbitrary Python code from R
### Aliases: py.exec
### Keywords: manip

### ** Examples

a <- 1:4
b <- 5:8
py.exec(c("def concat(a,b):", "\treturn a+b"))
py.call("concat", a, b)
# [1] 1 2 3 4 5 6 7 8

## Not run: 
##D py.exec("raise Exception('Stop the presses!')")
##D # Error in py.exec("raise Exception('Stop the presses!')") (from py.exec.R#48) : 
##D #   Traceback (most recent call last):
##D #   File "<string>", line 2, in <module>
##D # Exception: Stop the presses!
## End(Not run)

py.exec("raise Exception('Houston, we have a problem!')", stopOnException = FALSE)
# Warning message:
# In py.exec("raise Exception('Houston, we have a problem!')", stopOnException = FALSE) :
#   Traceback (most recent call last):
#   File "<string>", line 2, in <module>
# Exception: Houston, we have a problem!



