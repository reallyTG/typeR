library(rlang)


### Name: fn_body
### Title: Get or set function body
### Aliases: fn_body fn_body<-

### ** Examples

# fn_body() is like body() but always returns a block:
fn <- function() do()
body(fn)
fn_body(fn)

# It also throws an error when used on a primitive function:
try(fn_body(base::list))



