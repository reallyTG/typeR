library(rlang)


### Name: is_copyable
### Title: Is an object copyable?
### Aliases: is_copyable

### ** Examples

# Let's add attributes with structure() to uncopyable types. Since
# they are not copied, the attributes are changed in place:
env <- env()
structure(env, foo = "bar")
env

# These objects that can only be changed with side effect are not
# copyable:
is_copyable(env)

structure(base::list, foo = "bar")
str(base::list)



