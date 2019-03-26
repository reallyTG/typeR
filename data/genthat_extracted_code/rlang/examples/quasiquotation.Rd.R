library(rlang)


### Name: quasiquotation
### Title: Quasiquotation of an expression
### Aliases: quasiquotation UQ UQS !! !!! := qq_show

### ** Examples

# Quasiquotation functions quote expressions like base::quote()
quote(how_many(this))
expr(how_many(this))
quo(how_many(this))

# In addition, they support unquoting. Let's store symbols
# (i.e. object names) in variables:
this <- sym("apples")
that <- sym("oranges")

# With unquotation you can insert the contents of these variables
# inside the quoted expression:
expr(how_many(!!this))
expr(how_many(!!that))

# You can also insert values:
expr(how_many(!!(1 + 2)))
quo(how_many(!!(1 + 2)))


# Note that when you unquote complex objects into an expression,
# the base R printer may be a bit misleading. For instance compare
# the output of `expr()` and `quo()` (which uses a custom printer)
# when we unquote an integer vector:
expr(how_many(!!(1:10)))
quo(how_many(!!(1:10)))

# This is why it's often useful to use qq_show() to examine the
# result of unquotation operators. It uses the same printer as
# quosures but does not return anything:
qq_show(how_many(!!(1:10)))


# Use `!!!` to add multiple arguments to a function. Its argument
# should evaluate to a list or vector:
args <- list(1:3, na.rm = TRUE)
quo(mean(!!!args))

# You can combine the two
var <- quote(xyz)
extra_args <- list(trim = 0.9, na.rm = TRUE)
quo(mean(!!var , !!!extra_args))


# The plural versions have support for the `:=` operator.
# Like `=`, `:=` creates named arguments:
quos(mouse1 := bernard, mouse2 = bianca)

# The `:=` is mainly useful to unquote names. Unlike `=` it
# supports `!!` on its LHS:
var <- "unquote me!"
quos(!!var := bernard, mouse2 = bianca)


# All these features apply to dots captured by enquos():
fn <- function(...) enquos(...)
fn(!!!args, !!var := penny)


# Unquoting is especially useful for building an expression by
# expanding around a variable part (the unquoted part):
quo1 <- quo(toupper(foo))
quo1

quo2 <- quo(paste(!!quo1, bar))
quo2

quo3 <- quo(list(!!quo2, !!!syms(letters[1:5])))
quo3



