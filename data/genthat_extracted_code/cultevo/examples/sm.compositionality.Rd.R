library(cultevo)


### Name: sm.compositionality
### Title: Spike's segmentation and measure of additive compositionality.
### Aliases: sm.compositionality sm.segmentation

### ** Examples

# perfect communication system for two meaning features (which are marked
# as either present or absent)
sm.compositionality(c("a", "b", "ab"),
  cbind(a=c(TRUE, FALSE, TRUE), b=c(FALSE, TRUE, TRUE)))
sm.segmentation(c("a", "b", "ab"),
  cbind(a=c(TRUE, FALSE, TRUE), b=c(FALSE, TRUE, TRUE)))

# not quite perfect communication system
sm.compositionality(c("as", "bas", "basf"),
  cbind(a=c(TRUE, FALSE, TRUE), b=c(FALSE, TRUE, TRUE)))
sm.segmentation(c("as", "bas", "basf"),
  cbind(a=c(TRUE, FALSE, TRUE), b=c(FALSE, TRUE, TRUE)))

# same communication system, but force candidate segments to be non-overlapping
# via the 'strict' option
sm.segmentation(c("as", "bas", "basf"),
  cbind(a=c(TRUE, FALSE, TRUE), b=c(FALSE, TRUE, TRUE)), strict=TRUE)


# the function also accepts meaning-dimension based matrix definitions:
print(twobytwoanimals <- enumerate.meaningcombinations(c(animal=2, colour=2)))

# note how there are many more candidate segments than just the full length
# ones. the less data we have, the more likely it is that shorter substrings
# will be just as predictable as the full segments that contain them.
sm.segmentation(c("greendog", "bluedog", "greencat", "bluecat"), twobytwoanimals)

# perform the same analysis, but using the formula interface
print(twobytwosignalingsystem <- cbind(twobytwoanimals,
  signal=c("greendog", "bluedog", "greencat", "bluecat")))

sm.segmentation(signal ~ colour + animal, twobytwosignalingsystem)

# since there is no overlap in the constituent characters of the identified
# 'morphemes', they are all tied in their mutual predictiveness with the
# (shorter) substrings they contain
#
# to reduce the pool of candidate segments to those which are
# non-overlapping and of maximal length, again use the 'strict=TRUE' option:

sm.segmentation(signal ~ colour + animal, twobytwosignalingsystem, strict=TRUE)




