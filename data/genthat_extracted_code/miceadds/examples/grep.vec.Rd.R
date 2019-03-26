library(miceadds)


### Name: grep.vec
### Title: R Utilities: Vector Based Versions of 'grep'
### Aliases: grep.vec grep_leading grepvec_leading grepvec
### Keywords: R utilities

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example
#############################################################################

vec <- c("abcd", "bcde", "aedf", "cdf" )
# search for entries in vec with contain 'a' and 'f'
#  -> operator="AND"
grep.vec( pattern.vec=c("a","f"), x=vec )
  ##   $x
  ##   [1] "aedf"
  ##   $index.x
  ##   [1] 3

grepvec( pattern.vec=c("a","f"), x=vec, value=TRUE)
grepvec( pattern.vec=c("a","f"), x=vec, value=FALSE)

# search for entries in vec which contain 'a' or 'f'
grep.vec( pattern.vec=c("a","f"), x=vec, operator="OR")
  ##   $x
  ##   [1] "abcd" "aedf" "cdf"
  ##   $index.x
  ##   [1] 1 3 4



