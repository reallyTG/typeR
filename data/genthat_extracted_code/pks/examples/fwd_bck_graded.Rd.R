library(pks)


### Name: gradedness
### Title: Forward- or Backward-Gradedness of a Knowledge Structure
### Aliases: gradedness is.forward.graded is.backward.graded
### Keywords: models

### ** Examples

K <- as.binmat(c("0000", "1000", "1100", "1010", "0110", "1110", "1111"))
is.forward.graded(K)   # forward-graded in a
is.backward.graded(K)  # not backward-graded in a



