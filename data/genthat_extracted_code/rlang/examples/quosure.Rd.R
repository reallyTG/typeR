library(rlang)


### Name: quosure
### Title: Quosure getters, setters and testers
### Aliases: quosure is_quosure quo_is_missing quo_is_symbol quo_is_call
###   quo_is_symbolic quo_is_null quo_get_expr quo_get_env quo_set_expr
###   quo_set_env

### ** Examples

quo <- quo(my_quosure)
quo


# Access and set the components of a quosure:
quo_get_expr(quo)
quo_get_env(quo)

quo <- quo_set_expr(quo, quote(baz))
quo <- quo_set_env(quo, empty_env())
quo

# Test wether an object is a quosure:
is_quosure(quo)

# If it is a quosure, you can use the specialised type predicates
# to check what is inside it:
quo_is_symbol(quo)
quo_is_call(quo)
quo_is_null(quo)

# quo_is_missing() checks for a special kind of quosure, the one
# that contains the missing argument:
quo()
quo_is_missing(quo())

fn <- function(arg) enquo(arg)
fn()
quo_is_missing(fn())



