library(sig)


### Name: is.sig
### Title: Is the input a sig?
### Aliases: is.sig

### ** Examples

stopifnot(
  is.sig(sig(with)),
  !is.sig(with)     #functions are not their signatures.
)



