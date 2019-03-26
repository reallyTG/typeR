library(catchr)


### Name: user_exit
### Title: Force an exit
### Aliases: user_exit exit_with

### ** Examples

yay <- catch_expr({warning("oops"); "done!"},
                  warning = exit_with("YAY"))

# This won't work, since `user_exit("YAY")` doesn't evaluate to a function/string
## Not run: 
##D yay <- catch_expr({warning("oops"); "done!"},
##D                   warning = user_exit("YAY"))
## End(Not run)

check <- function(cond) {
  if (inherits(cond, "simpleWarning"))
    user_exit(rlang::warn(paste0("Check it: ", cond$message)))
  else
    invokeRestart(first_muffle_restart(cond))
  NULL
}

result <- catch_expr(
  { rlang::warn("This will be muffled")
    warning("This won't be muffled") },
  warning = check)
# Notice that `result` takes whatever the last (invisibly)
#   returned value is. Here, that's the message from the warning
result

# If you don't want to accidentally assign what is returned by `user_exit`,
#   either add `NULL` to the end of the expresion:
result2 <- catch_expr(
  { rlang::warn("This will be muffled")
    warning("This won't be muffled")},
  warning = function(x) { user_exit({ warning("This won't be assigned"); NULL})})
result2

# Or you can just do the assignment _within_ the expression being evaluated:
result3 <- NULL
catch_expr({result3 <- {
    rlang::warn("This will be muffled")
    warning("This won't be muffled")}},
  warning = check)
result3



