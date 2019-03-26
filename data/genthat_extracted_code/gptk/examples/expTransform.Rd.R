library(gptk)


### Name: expTransform
### Title: Constrains a parameter.
### Aliases: expTransform sigmoidTransform boundedTransform
### Keywords: model

### ** Examples

  # Transform unconstrained parameter -4 to a positive value
  expTransform(-4, 'atox')

  # Transform a bounded parameter in (1,3) to an unconstrained one
  boundedTransform(2, 'xtoa', c(1, 3))



