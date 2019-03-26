library(gsubfn)


### Name: as.function.formula
### Title: Make a one-line function from a formula.
### Aliases: as.function.formula
### Keywords: character

### ** Examples

old.options <- options(keep.source = FALSE)
as.function(~ as.numeric(x) + as.numeric(y))
as.function(x + y ~ as.numeric(x) + as.numeric(y)) # same
as.function(~ ..1 + ..2)
# the replacement function in gsubfn uses as.function.formula to
# interpret formulas as functions.  Here we insert ! after each digit.
gsubfn("[0-9]", ~ paste0(`&`, "!"), "ab4cd5") 
## Not run: 
##D # example where function body must be surrounded with {...} 
##D # due to use of <<-.  See warning section above.
##D assign("mywarn", NULL, .GlobalEnv)
##D fn$tryCatch( warning("a warning"), 
##D     warning = w ~ { mywarn <<- conditionMessage(w)})
##D print(mywarn)
## End(Not run)
options(old.options)



