library(catchr)


### Name: catch_expr
### Title: Catch conditions
### Aliases: catch_expr make_catch_fn

### ** Examples

warner <- function() {
  warning("Suppress this!")
  "done!"
}

compiled_warning_plans <- make_plans(warning = muffle)
warning_catcher <- make_catch_fn(warning = muffle)
warning_catcher2 <- make_catch_fn(compiled_warning_plans)

# `results` 1-4 are equivalent
results1 <- catch_expr(warner(), warning = muffle)
results2 <- warning_catcher(warner())
results3 <- catch_expr(warner(), compiled_warning_plans)
results4 <- warning_catcher2(warner())



