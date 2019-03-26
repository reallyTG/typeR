library(evaluate)


### Name: inject_funs
### Title: Inject functions into the environment of 'evaluate()'
### Aliases: inject_funs
### Keywords: internal

### ** Examples

library(evaluate)
# normally you cannot capture the output of system
evaluate("system('R --version')")

# replace the system() function
inject_funs(system = function(...) cat(base::system(..., intern = TRUE), sep = "\n"))

evaluate("system('R --version')")

inject_funs()  # empty previously injected functions



