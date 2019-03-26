library(catchr)


### Name: with_ordered_handlers
### Title: Establish handlers on the stack (in order)
### Aliases: with_ordered_handlers

### ** Examples

# Although set first, 'condition' never gets to catch the condition
rlang::with_handlers(warning("woops!"),
              condition = rlang::calling(function(x) print("CONDITION")),
              warning = rlang::exiting(function(x) { print("WARNING")}))

# Should print for both
with_ordered_handlers(warning("woops!"),
              condition = rlang::calling(function(x) print("CONDITION")),
              warning = rlang::exiting(function(x) { print("WARNING")}))



