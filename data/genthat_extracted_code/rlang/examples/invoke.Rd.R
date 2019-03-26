library(rlang)


### Name: invoke
### Title: Invoke a function with a list of arguments
### Aliases: invoke
### Keywords: internal

### ** Examples

# invoke() has the same purpose as do.call():
invoke(paste, letters)

# But it creates much cleaner calls:
invoke(call_inspect, mtcars)

# and stacktraces:
fn <- function(...) sys.calls()
invoke(fn, list(mtcars))

# Compare to do.call():
do.call(call_inspect, mtcars)
do.call(fn, list(mtcars))


# Specify the function name either by supplying a string
# identifying the function (it should be visible in .env):
invoke("call_inspect", letters)

# Or by changing the .bury argument, with which you can also change
# the argument prefix:
invoke(call_inspect, mtcars, .bury = c("inspect!", "col"))



