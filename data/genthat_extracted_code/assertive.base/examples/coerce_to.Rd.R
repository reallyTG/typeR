library(assertive.base)


### Name: coerce_to
### Title: Coerce variable to a different class
### Aliases: coerce_to

### ** Examples

# Numbers can be coerced to characters but not to calls.
dont_stop(coerce_to(1:5, c("call", "character")))



