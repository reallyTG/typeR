library(FastImputation)


### Name: NormalizeBoundedVariable
### Title: Take a variable bounded above/below/both and return an unbounded
###   (normalized) variable.
### Aliases: NormalizeBoundedVariable

### ** Examples

  constraints=list(lower=5)           # lower bound when constrining to an interval
  constraints=list(upper=10)          # upper bound when constraining to an interval
  constraints=list(lower=5, upper=10) # both lower and upper bounds



