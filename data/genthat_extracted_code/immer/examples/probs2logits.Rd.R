library(immer)


### Name: probs2logits
### Title: Conversion of Probabilities into Logits
### Aliases: probs2logits logits2probs

### ** Examples

#############################################################################
# EXAMPLE 1: Probability-logit-conversions: a toy example
#############################################################################

# define vector of probabilities
probs <- c( .3, .25, .25, .2)
sum(probs)

# convert probabilities into logits
y <- immer::probs2logits( probs )
# retransform logits into probabilities
immer::logits2probs(y)



