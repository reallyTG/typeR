library(textreuse)


### Name: lsh_probability
### Title: Probability that a candidate pair will be detected with LSH
### Aliases: lsh_probability lsh_threshold

### ** Examples

# Threshold for default values
lsh_threshold(h = 200, b = 40)

# Probability for varying values of s
lsh_probability(h = 200, b = 40, s = .25)
lsh_probability(h = 200, b = 40, s = .50)
lsh_probability(h = 200, b = 40, s = .75)



