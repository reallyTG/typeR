library(DescTools)


### Name: DoCall
### Title: Fast Alternative To The Internal 'do.call'
### Aliases: DoCall

### ** Examples

DoCall("complex", list(imaginary = 1:3))

## if we already have a list (e.g. a data frame)
## we need c() to add further arguments
tmp <- expand.grid(letters[1:2], 1:3, c("+", "-"))
DoCall("paste", c(tmp, sep = ""))

## examples of where objects will be found.
A <- 2
f <- function(x) print(x^2)
env <- new.env()
assign("A", 10, envir = env)
assign("f", f, envir = env)
f <- function(x) print(x)
f(A)                                         # 2
DoCall("f", list(A))                         # 2
DoCall("f", list(A), envir = env)            # 4
DoCall(f, list(A), envir = env)              # 2
DoCall("f", list(quote(A)), envir = env)     # 100
DoCall(f, list(quote(A)), envir = env)       # 10
DoCall("f", list(as.name("A")), envir = env) # 100

eval(call("f", A))                           # 2
eval(call("f", quote(A)))                    # 2
eval(call("f", A), envir = env)              # 4
eval(call("f", quote(A)), envir = env)       # 100



