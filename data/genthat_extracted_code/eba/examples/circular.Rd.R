library(eba)


### Name: circular
### Title: Circular Triads (Intransitive Cycles)
### Aliases: circular print.circular
### Keywords: models

### ** Examples

# A dog's preferences for six samples of food
# (Kendall and Babington Smith, 1940, p. 326)
dog <- matrix(c(0, 1, 1, 0, 1, 1,
                0, 0, 0, 1, 1, 0,
                0, 1, 0, 1, 1, 1,
                1, 0, 0, 0, 0, 0,
                0, 0, 0, 1, 0, 1,
                0, 1, 0, 1, 0, 0), 6, 6, byrow=TRUE)
dimnames(dog) <- setNames(rep(list(c("meat", "biscuit", "chocolate",
                                     "apple", "pear", "cheese")), 2),
                          c(">", "<"))
circular(dog, alternative="less")  # moderate consistency
subset(strans(dog)$violdf, !wst)   # list circular triads



