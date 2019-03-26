library(pmultinom)


### Name: invert.pmultinom
### Title: Calculate the sample size such that the probability of a result
###   is a given amount.
### Aliases: invert.pmultinom

### ** Examples

# How many cells must be sequenced to have a 95% chance of
# observing at least 2 from each subclone of a tumor? (Data
# from Casasent et al (2018); see vignette("pmultinom") for
# details of this example)

# Input: 
ncells <- 204
subclone.freqs <- c(43, 20, 82, 17, 5, 37)/ncells
target.number <- c(2, 2, 2, 2, 2, 0)
lower.bound <- target.number - 1
invert.pmultinom(lower=lower.bound, probs=subclone.freqs,
                 target.prob=.95, method="exact")
# Output:
# [1] 192




