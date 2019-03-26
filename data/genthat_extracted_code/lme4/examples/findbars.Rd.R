library(lme4)


### Name: findbars
### Title: Determine random-effects expressions from a formula
### Aliases: findbars
### Keywords: models utilities

### ** Examples

findbars(f1 <- Reaction ~ Days + (Days | Subject))
## => list( Days | Subject )
## These two are equivalent:% tests in ../inst/tests/test-doubleVertNotation.R
findbars(y ~ Days + (1 | Subject) + (0 + Days | Subject))
findbars(y ~ Days + (Days || Subject))
## => list of length 2:  list ( 1 | Subject ,  0 + Days | Subject)
findbars(~ 1 + (1 | batch / cask))
## => list of length 2:  list ( 1 | cask:batch ,  1 | batch)
## Don't show: 
stopifnot(identical(findbars(f1),
                    list(quote(Days | Subject))))
## End(Don't show)



