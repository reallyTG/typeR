library(rlang)


### Name: exec
### Title: Execute a function
### Aliases: exec

### ** Examples

args <- list(x = c(1:10, 100, NA), na.rm = TRUE)
exec("mean", !!!args)
exec("mean", !!!args, trim = 0.2)

fs <- list(a = function() "a", b = function() "b")
lapply(fs, exec)

# Compare to do.call it will not automatically inline expressions
# into the evaluated call.
x <- 10
args <- exprs(x1 = x + 1, x2 = x * 2)
exec(list, !!!args)
do.call(list, args)

# exec() is not designed to generate pretty function calls. This is
# most easily seen if you call a function that captures the call:
f <- disp ~ cyl
exec("lm", f, data = mtcars)

# If you need finer control over the generated call, you'll need to
# construct it yourself. This may require creating a new environment
# with carefully constructed bindings
data_env <- env(data = mtcars)
eval(expr(lm(!!f, data)), data_env)



