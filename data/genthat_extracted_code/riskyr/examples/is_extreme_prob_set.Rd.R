library(riskyr)


### Name: is_extreme_prob_set
### Title: Verify that a set of probabilities describes an extreme case.
### Aliases: is_extreme_prob_set

### ** Examples

# Identify 6 extreme cases (+ 4 variants):
is_extreme_prob_set(1, 1, NA, 1, NA)       # => TRUE + warning: N true positives
plot_tree(1, 1, NA, 1, NA, N = 100)        # => illustrates this case

is_extreme_prob_set(1, 0, NA, 1, NA)       # => TRUE + warning: N false negatives
plot_tree(1, 0, NA, 1, NA, N = 200)        # => illustrates this case

sens <- .50
is_extreme_prob_set(0, sens, NA, 0, NA)    # => TRUE + warning: N false positives
plot_tree(0, sens, NA, 0, N = 300)         # => illustrates this case
# Variant:
is_extreme_prob_set(0, sens, NA, NA, 1)    # => TRUE + warning: N false positives
plot_tree(0, sens, NA, NA, 1, N = 350)     # => illustrates this case

sens <- .50
is_extreme_prob_set(0, sens, NA, 1)        # => TRUE + warning: N true negatives
plot_tree(0, sens, NA, NA, 1, N = 400)     # => illustrates this case
# Variant:
is_extreme_prob_set(0, sens, NA, NA, 0)    # => TRUE + warning: N true negatives
plot_tree(0, sens, NA, NA, 0, N = 450)     # => illustrates this case

prev <- .50
is_extreme_prob_set(prev, 0, NA, 1, NA)    # => TRUE + warning: 0 hi and 0 fa (0 dec.pos cases)
plot_tree(prev, 0, NA, 1, NA, N = 500)     # => illustrates this case
# # Variant:
is_extreme_prob_set(prev, 0, 0, NA, 0)     # => TRUE + warning: 0 hi and 0 fa (0 dec.pos cases)
plot_tree(prev, 0, NA, 1, NA, N = 550)     # => illustrates this case

prev <- .50
is_extreme_prob_set(prev, 1, NA, 0, NA)    # => TRUE + warning: 0 mi and 0 cr (0 dec.neg cases)
plot_tree(prev, 1, NA, 0, NA, N = 600)     # => illustrates this case
# # Variant:
is_extreme_prob_set(prev, 1, NA, 0, NA)    # => TRUE + warning: 0 mi and 0 cr (0 dec.neg cases)
plot_tree(prev, 1, NA, 0, NA, N = 650)     # => illustrates this case





