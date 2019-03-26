library(swirl)


### Name: is_robust_match
### Title: Recursively expand both the correct expression and the user's
###   expression and test for a match. CAUTION: May raise errors, as in
###   rmatch_calls.
### Aliases: is_robust_match

### ** Examples

## Not run: 
##D   
##D   expr1 <- quote(print(paste("my_name_is", "mud")))
##D   expr2 <- quote(print(paste("my_name_is", "mud", sep=" ")))
##D   err <- try(ans <- is_robust_match(expr1, expr2, eval_for_class=TRUE), silent=TRUE)
##D   if(is(ans, "try-error")){
##D     ans <- isTRUE(all.equal())
##D   }
## End(Not run)



