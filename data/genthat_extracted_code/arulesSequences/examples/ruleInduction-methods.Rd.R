library(arulesSequences)


### Name: ruleInduction-methods
### Title: Induce Sequence Rules
### Aliases: ruleInduction ruleInduction,sequences-method
### Keywords: models

### ** Examples

## continue example
example(cspade)

## mine rules
r2 <- ruleInduction(s2, confidence = 0.5,
			control    = list(verbose = TRUE))
summary(r2)
as(r2, "data.frame")



