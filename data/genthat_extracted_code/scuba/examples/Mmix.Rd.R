library(scuba)


### Name: Mmix
### Title: Compute M-values for a Mixture of Inert Gases
### Aliases: Mmix M0mix
### Keywords: utilities

### ** Examples

  # Trimix 18/50, surfacing M-values
  M0mix("Z", trimix(0.18, 0.5))

  # Trimix 18/50, M-values at 0, 10, 20 metres
  Mmix("Z", c(0,10,20), trimix(0.18, 0.5))



