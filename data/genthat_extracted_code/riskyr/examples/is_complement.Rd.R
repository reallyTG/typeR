library(riskyr)


### Name: is_complement
### Title: Verify that two numbers are complements.
### Aliases: is_complement

### ** Examples

# Basics:
is_complement(0, 1)           # => TRUE
is_complement(1/3, 2/3)       # => TRUE
is_complement(.33, .66)       # => TRUE  (as within default tol = .01)
is_complement(.33, .65)       # => FALSE (as beyond default tol = .01)

# watch out for:
is_complement(NA, NA)            # => NA (but not FALSE)
is_complement(1, NA)             # => NA (but not FALSE)
is_complement(2, -1)             # => TRUE + warnings (p1 and p2 beyond range)
is_complement(8, -7)             # => TRUE + warnings (p1 and p2 beyond range)
is_complement(.3, .6)            # => FALSE + warning (beyond tolerance)
is_complement(.3, .6, tol = .1)  # => TRUE (due to increased tolerance)

## ways to fail:
# is_complement(0, 0)            # => FALSE + warning (beyond tolerance)
# is_complement(1, 1)            # => FALSE + warning (beyond tolerance)
# is_complement(8, 8)            # => FALSE + warning (beyond tolerance)





