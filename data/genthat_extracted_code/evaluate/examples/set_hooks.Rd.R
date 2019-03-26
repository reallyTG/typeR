library(evaluate)


### Name: set_hooks
### Title: Set hooks.
### Aliases: set_hooks
### Keywords: internal

### ** Examples

new <- list(before.plot.new = function() print("Plotted!"))
hooks <- set_hooks(new)
plot(1)
set_hooks(hooks, "replace")
plot(1)



