library(berryFunctions)


### Name: traceCall
### Title: call stack of a function
### Aliases: traceCall
### Keywords: error programming

### ** Examples

lower <- function(a, s) {warning(traceCall(s), "stupid berry warning: ", a+10); a}
upper <- function(b, skip=0) lower(b+5, skip)
upper(3)
upper(3, skip=1) # traceCall skips last level (warning)
upper(3, skip=4) # now the stack is empty
d <- tryStack(upper("four"), silent=TRUE)
inherits(d, "try-error")
cat(d)

lower <- function(a,...) {warning(traceCall(1, prefix="in ", suffix=": "),
                          "How to use traceCall in functions ", call.=FALSE); a}
upper(3)




