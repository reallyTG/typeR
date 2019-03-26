library(SnakeCharmR)


### Name: py.get
### Title: Get values from Python variables to R
### Aliases: py.get

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

## Not run: 
##D py.rm("notset")
##D py.get("notset")
##D # Error in py.get("notset") (from py.get.R#60) : Traceback (most recent call last):
##D #   File "<string>", line 2, in <module>
##D # NameError: name 'notset' is not defined
## End(Not run)



