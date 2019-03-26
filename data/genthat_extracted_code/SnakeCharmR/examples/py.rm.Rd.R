library(SnakeCharmR)


### Name: py.rm
### Title: Remove a Python variable from R
### Aliases: py.rm

### ** Examples

py.assign("a", "foo bar")
py.get("a")
# [1] "foo bar"
py.rm("a")
## Not run: 
##D py.rm("a")
##D # Warning message:
##D # In py.rm("a") : Traceback (most recent call last):
##D #   File "<string>", line 2, in <module>
##D # NameError: name 'a' is not defined
## End(Not run)



