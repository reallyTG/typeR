library(swirl)


### Name: rmatch_calls
### Title: Recursively expand match calls in an expression from the bottom
###   up.
### Aliases: rmatch_calls

### ** Examples

## Not run: 
##D 
##D # Function
##D rmatch_calls(quote(help("print")))
##D help(topic = "print", package = NULL, lib.loc = NULL, verbose = getOption("verbose"), 
##D try.all.packages = getOption("help.try.all.packages"), help_type = getOption("help_type"))
##D 
##D # S3 method with atomic first argument
##D rmatch_calls(quote(seq(0, 1, by=.5)))
##D seq(from = 0, to = 1, by = 0.5, length.out = NULL, along.with = NULL)
##D 
##D # S3 method with non-atomic first argument, eval_for_class = FALSE (default)
##D rmatch_calls(quote(seq(as.Date("2014-02-01"), as.Date("2014-03-01"))))
##D #Error in rmatch_calls(quote(seq(as.Date("2014-02-01"), as.Date("2014-03-01")))) : 
##D #  Illegal expression, seq(as.Date(x = "2014-02-01"), as.Date(x = "2014-03-01")): 
##D #  The first argument, as.Date(x = "2014-02-01"), to S3 method 'seq', is a call, 
##D #  which (as an expression) is not atomic, hence its class can't be determined in an 
##D #  abstract syntax tree without additional information.
##D  
##D # S3 method with non-atomic first argument, eval_for_class = TRUE
##D rmatch_calls(quote(seq(as.Date("2014-02-01"), as.Date("2014-03-01"))), eval_for_class=TRUE)
##D seq(from = as.Date(x = "2014-02-01"), to = as.Date(x = "2014-03-01"), 
##D     length.out = NULL, along.with = NULL)  
## End(Not run)



