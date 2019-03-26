library(lazyeval)


### Name: f_interp
### Title: Interpolate a formula
### Aliases: f_interp uq uqs uqf

### ** Examples

f_interp(x ~ 1 + uq(1 + 2 + 3) + 10)

# Use uqs() if you want to add multiple arguments to a function
# It must evaluate to a list
args <- list(1:10, na.rm = TRUE)
f_interp(~ mean( uqs(args) ))

# You can combine the two
var <- quote(xyz)
extra_args <- list(trim = 0.9)
f_interp(~ mean( uq(var) , uqs(extra_args) ))

foo <- function(n) {
  ~ 1 + uq(n)
}
f <- foo(10)
f
f_interp(f)



