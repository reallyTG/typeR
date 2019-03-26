library(SnakeCharmR)


### Name: py.assign
### Title: Assign values to Python variables from R
### Aliases: py.assign

### ** Examples

py.assign("a", 1:4)
py.get("a")
# [1] 1 2 3 4

py.assign("b", list(one = 1, foo = "bar"))
str(py.get("b"))
# List of 2
#  $ foo: chr "bar"
#  $ one: int 1

py.exec("import math")
py.get("math.pi")
# [1] 3.141593

# by default jsonlite::toJSON is called on the value to be assigned
# with auto_unbox = TRUE, so vectors of length 1 are simplified to
# scalar values in Python
py.assign("c", "foo bar")
py.exec("crepr = repr(c)")
py.get("crepr")
# [1] "u'foo bar'"

# if we explicitly set auto_unbox to FALSE, a vector of length 1
# becomes a Python list of length 1
py.assign("d", "foo bar", json.opt.args = list(auto_unbox = FALSE))
py.exec("drepr = repr(d)")
py.get("drepr")
# [1] "[u'foo bar']"



