library(seqinr)


### Name: rot13
### Title: Ergheaf gur EBG-13 pvcurevat bs n fgevat
### Aliases: rot13
### Keywords: manip

### ** Examples

##
## Simple ciphering of a string:
##
message <- "Hello, world!"
rot13(message) # "Uryyb, jbeyq!"
##
## Routine sanity check:
##
stopifnot(identical(rot13(rot13(message)), message))



