library(seqinr)


### Name: s2n
### Title: simple numerical encoding of a DNA sequence.
### Aliases: s2n
### Keywords: utilities

### ** Examples

##
## Example of default behaviour:
##
urndna <- s2c("acgt")
seq <- sample( urndna, 100, replace = TRUE ) ; seq
s2n(seq)
##
## How to deal with RNA:
##
urnrna <- s2c("acgt")
seq <- sample( urnrna, 100, replace = TRUE ) ; seq
s2n(seq)
##
## what happens with unknown characters:
##
urnmess <- c(urndna,"n")
seq <- sample( urnmess, 100, replace = TRUE ) ; seq
s2n(seq)
##
## How to change the encoding for unknown characters:
##
tmp <- s2n(seq) ; tmp[is.na(tmp)] <- -1; tmp
##
## Simple sanity check:
##
stopifnot(all(s2n(s2c("acgt")) == 0:3))



