library(bspec)


### Name: temper
### Title: Tempering of (posterior) distributions
### Aliases: temper temper.bspec
### Keywords: ts

### ** Examples

lhspec <- bspec(lh, priorscale=0.6, priordf=1)

# details of the regular posterior distribution:
str(lhspec)

# details of the tempered distribution
# (note the differing scale and degrees-of-freedom):
str(temper(lhspec, 1.23))



