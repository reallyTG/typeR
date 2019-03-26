library(seqinr)


### Name: pmw
### Title: Protein Molecular Weight
### Aliases: pmw
### Keywords: utilities

### ** Examples

allowed <- s2c("*ACDEFGHIKLMNPQRSTVWY") # All allowed chars in a protein
pmw(allowed)
all.equal(pmw(allowed), 2395.71366) # Should be true on most platforms
#
# Compute the apparent molecular weight on Moon surface:
#
pmw(allowed, g = 1.6)
#
# Compute the apparent molecular weight in absence of gravity:
#
pmw(allowed, g = 0) # should be zero
#
# Reports results in Newton units:
#
pmw(allowed, unit = "N")
#
# Compute the mass in kg of one mol of this protein:
#
pmw(allowed)/10^3
#
# Compute the mass for all amino-acids:
#
sapply(allowed[-1], pmw) -> aamw
names(aamw) <- aaa(names(aamw))
aamw



