library(catchr)


### Name: collecting-conditions
### Title: Collect conditions, without halting processes
### Aliases: collecting-conditions collect

### ** Examples

one_of_each <- function(with_error) {
  rlang::inform("This is a message")
  rlang::warn("This is a warning")
  if (with_error)
    stop("This is an error", call.=FALSE)
  "return value!"
}

collecting_plans <- make_plans(message, warning, error,
                               .opts = catchr_opts(default_plan = c(collect, muffle),
                                                   drop_empty_conds = FALSE))

# When the evaluation completes, the "value" element is the value the expression returns
no_error <- catch_expr(one_of_each(FALSE), collecting_plans)
no_error$value

# If it doesn't return, the value is generally NULL
with_error <- catch_expr(one_of_each(TRUE), collecting_plans)
with_error$value

# If the option `drop_empty_conds` == TRUE, then
#   sublists without collected condition will be dropped
catch_expr(one_of_each(FALSE), collecting_plans,
           .opts = catchr_opts(drop_empty_conds=TRUE))

# If the option `bare_if_possible` == TRUE, then even
#   functions that don't use `collect` will return the value
#   of the expression as a "value" sublist
catch_expr("DONE", fake_cond = muffle, .opts = catchr_opts(bare_if_possible=FALSE))



