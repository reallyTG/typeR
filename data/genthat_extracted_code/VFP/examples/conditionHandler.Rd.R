library(VFP)


### Name: conditionHandler
### Title: Condition-Handling Without Losing Information.
### Aliases: conditionHandler

### ** Examples

conditionHandler(warning("This is a warning!"))
f <- function(expr){warning("This a warning!"); eval(expr)}
conditionHandler(f(1/2))
conditionHandler(stop("This is an error!"))
conditionHandler(1/"a")



