library(icsw)


### Name: clip.small.probs
### Title: Replace probabilities below threshold with threshold value
### Aliases: clip.small.probs
### Keywords: ~kwd1 ~kwd2

### ** Examples


probs <- seq(0, .01, by = .001)
min(clip.small.probs(probs, .05))

# without min.prob, uses smallest value > 0
min(clip.small.probs(probs))




