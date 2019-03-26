library(tidytidbits)


### Name: eval_unquoted
### Title: Execute code after tidy evaluation
### Aliases: eval_unquoted

### ** Examples

library(rlang)
# Note that evaluation takes place in the calling environment!
l <- quo(l <- 1) # l is a quosure in our env
eval_unquoted(!!l)
l == 1 # TRUE: l is now a vector



