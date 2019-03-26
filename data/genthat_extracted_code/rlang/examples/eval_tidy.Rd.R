library(rlang)


### Name: eval_tidy
### Title: Evaluate an expression with quosures and pronoun support
### Aliases: eval_tidy

### ** Examples


# With simple quoted expressions eval_tidy() works the same way as
# eval():
apple <- "apple"
kiwi <- "kiwi"
expr <- quote(paste(apple, kiwi))
expr

eval(expr)
eval_tidy(expr)

# Both accept a data mask as argument:
data <- list(apple = "CARROT", kiwi = "TOMATO")
eval(expr, data)
eval_tidy(expr, data)


# In addition eval_tidy() has support for quosures:
with_data <- function(data, expr) {
  quo <- enquo(expr)
  eval_tidy(quo, data)
}
with_data(NULL, apple)
with_data(data, apple)
with_data(data, list(apple, kiwi))

# Secondly eval_tidy() installs handy pronouns that allow users to
# be explicit about where to find symbols:
with_data(data, .data$apple)
with_data(data, .env$apple)


# Note that instead of using `.env` it is often equivalent and may
# be preferred to unquote a value. There are two differences. First
# unquoting happens earlier, when the quosure is created. Secondly,
# subsetting `.env` with the `$` operator may be brittle because
# `$` does not look through the parents of the environment.
#
# For instance using `.env$name` in a magrittr pipeline is an
# instance where this poses problem, because the magrittr pipe
# currently (as of v1.5.0) evaluates its operands in a *child* of
# the current environment (this child environment is where it
# defines the pronoun `.`).
## Not run: 
##D   data %>% with_data(!!kiwi)     # "kiwi"
##D   data %>% with_data(.env$kiwi)  # NULL
## End(Not run)



