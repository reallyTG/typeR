library(seqinr)


### Name: move
### Title: Rename an R object
### Aliases: move mv

### ** Examples

#
# Example in a new empty environment:
#
local({
  zefplock <- pi
  print(ls())
  print(zefplock)
  mv(zefplock, toto)
  print(ls())
  print(toto)
  stopifnot(identical(toto, pi)) # Sanity check
})
#
# Check that self-affectation is possible:
#
mv(mv, mv) # force self-affectation for the function itself
mv(mv, mv) # OK, function mv() still exists



