library(pmultinom)


### Name: pmultinom
### Title: Calculate the probability that a multnomial random vector is
###   between, elementwise, two other vectors.
### Aliases: pmultinom

### ** Examples

# To determine the bias of a die, Rudolph Wolf rolled it
# 20,000 times. Side 2 was the most frequently observed, and
# was observed 3631 times. What is the probability that a
# fair die would have a side observed this many times or
# more?

# Input: 
1 - pmultinom(upper=rep.int(3630, 6), size=20000,
              probs=rep.int(1/6, 6), method="exact")
# Output:
# [1] 7.379909e-08

# Therefore we conclude that the die is biased. Fougere
# (1988) attempted to account for these biases by assuming
# certain manufacturing errors. Repeating the calculation
# with the distribution Fougere derived:

# Input:
theoretical.dist <- c(.17649, .17542, .15276, .15184, .17227, .17122)
1 - pmultinom(upper=rep.int(3630, 6), size=20000,
              probs=theoretical.dist, method="exact")
# Output:
# [1] 0.043362

# Therefore we conclude that the die still seems more biased
# than Fougere's model can explain.




