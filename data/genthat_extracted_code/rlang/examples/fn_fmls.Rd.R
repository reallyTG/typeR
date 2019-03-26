library(rlang)


### Name: fn_fmls
### Title: Extract arguments from a function
### Aliases: fn_fmls fn_fmls_names fn_fmls_syms fn_fmls<- fn_fmls_names<-

### ** Examples

# Extract from current call:
fn <- function(a = 1, b = 2) fn_fmls()
fn()

# Works with primitive functions:
fn_fmls(base::switch)

# fn_fmls_syms() makes it easy to forward arguments:
call2("apply", !!! fn_fmls_syms(lapply))

# You can also change the formals:
fn_fmls(fn) <- list(A = 10, B = 20)
fn()

fn_fmls_names(fn) <- c("foo", "bar")
fn()



