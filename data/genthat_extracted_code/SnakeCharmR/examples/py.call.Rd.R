library(SnakeCharmR)


### Name: py.call
### Title: Calls Python functions and methods from R
### Aliases: py.call

### ** Examples

py.call("len", 1:3)
# [1] 3

py.call("repr", 1:3)
# [1] "[1, 2, 3]"

a <- 1:4
b <- 5:8
py.exec("def concat(a,b): return a+b")
py.call("concat", a, b)
# [1] 1 2 3 4 5 6 7 8

py.assign("a",  "hola hola")
py.call("a.split", " ")
# [1] "hola" "hola"

# by default jsonlite::toJSON is called on the function call arguments
# with auto_unbox = TRUE, so vectors of length 1 are simplified to
# scalar values in Python
py.call("repr", "foo bar")
# [1] "u'foo bar'"

# if we explicitly set auto_unbox to FALSE, a vector of length 1
# becomes a Python list of length 1
py.call("repr", "foo bar", json.opt.args = list(auto_unbox = FALSE))
# [1] "[u'foo bar']"



