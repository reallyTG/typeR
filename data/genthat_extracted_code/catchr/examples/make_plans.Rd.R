library(catchr)


### Name: make_plans
### Title: Making catchr plans
### Aliases: make_plans catchr-plans

### ** Examples

# ### INPUT EXAMPLES ###########################

# Named arguments --------------------------------------

#   * single functions:
p <- make_plans(warning = str, message = function(x) print(x))

#   * single unquoted expressions and strings
#     (must match catchr's special reserved terms, e.g., 'muffle', 'exit', etc.):
p <- make_plans(message = muffle, condition = "collect")

#   * lists or vectors of any combinatin of the above:
p <- make_plans(error = list(collect, "exit"),
                message = c(cat, "muffle"))

#   * anything that evaluates to the above:
fn <- function() { list(cat, "muffle") }
p <- make_plans(message = fn() )

# Unnamed arguments ----------------------

#   * single strings:
p <- make_plans("warning","condition")

#   * unquoted expressions:
p <- make_plans(warning,condition)

#   * Currently, does NOT accept anything that evaluates to strings:
#       (However, this may change in the future)
## Not run: 
##D string_fn <- function() { "condition" }
##D make_plans(string_fn()) # will currently raise error
## End(Not run)

# Mixes of both --------------------------
p <- make_plans("warning", message = c(towarning, muffle),
                condition = print)

# ### Quasiquotation and splicing in the arguments ###############

q <- rlang::quo(function(cond) {print(cond)})
name <- "warning"

print_plan <- make_plans(!!name := !!q)

# 'message' will be assigned the default plan
qs <- rlang::quos(warning = muffle, error = exit, message)
random_plan <- make_plans(!!!qs)




