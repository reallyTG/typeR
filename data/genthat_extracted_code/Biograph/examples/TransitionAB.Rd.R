library(Biograph)


### Name: TransitionAB
### Title: Occurrences of selected transition by age
### Aliases: TransitionAB

### ** Examples

# Example 1: Transition NJ in GLHS data set
  data (GLHS)
  z <- TransitionAB (GLHS,"NJ",keep=TRUE)

# Example 2: Transition HM in NLOG98 data set
  data (NLOG98)
  z <- TransitionAB (NLOG98,"HM")

# Example 3: Transition 'Leaving parental home", irrespective of destination state
  data (NLOG98)
  z <- TransitionAB (NLOG98,"H*")

# Example 4: First marriage, irrespective of origin state
  data (NLOG98)
  z <- TransitionAB (NLOG98,"*M")



