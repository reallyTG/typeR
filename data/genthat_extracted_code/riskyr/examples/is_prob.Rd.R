library(riskyr)


### Name: is_prob
### Title: Verify that input is a probability (numeric value from 0 to 1).
### Aliases: is_prob

### ** Examples

# ways to succeed:
is_prob(1/2)                  # => TRUE
p.seq <- seq(0, 1, by = .1)
is_prob(p.seq)                # => TRUE (for vector)

# watch out for:
is_prob(NA)                   # => FALSE + NO warning!
is_prob(0/0)                  # => FALSE + NO warning (NA + NaN values)
is_prob(0/0, NA.warn = TRUE)  # => FALSE + warning (NA values)

# ways to fail:
is_prob(8)                    # => FALSE + warning (outside range)
is_prob(c(.5, 8))             # => FALSE + warning (for vector)
is_prob("Laplace")            # => FALSE + warning (non-numeric values)




