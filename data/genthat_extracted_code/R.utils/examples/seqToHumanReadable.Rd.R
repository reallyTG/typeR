library(R.utils)


### Name: seqToHumanReadable
### Title: Gets a short human readable string representation of an vector
###   of indices
### Aliases: seqToHumanReadable.default seqToHumanReadable
### Keywords: attribute

### ** Examples

  print(seqToHumanReadable(1:2))                 # "1, 2"
  print(seqToHumanReadable(1:2, tau=1))          # "1-2"
  print(seqToHumanReadable(1:10))                # "1-10"
  print(seqToHumanReadable(c(1:10, 15:18, 20)))  # "1-10, 15-18, 20"



