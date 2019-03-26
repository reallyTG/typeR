library(ircor)


### Name: tau
### Title: Kendall tau Rank Correlation Coefficients
### Aliases: tau tau_a tau_b

### ** Examples

# No ties
x <- c(0.67, 0.45, 0.29, 0.12, 0.57, 0.24, 0.94, 0.75, 0.08, 0.54)
y <- c(0.48, 0.68, 0.32, 0.09, 0.06, 0.61, 0.87, 0.22, 0.44, 0.84)
tau(x, y)
tau_a(x,y) # same as tau
tau_b(x,y) # same as tau

# Ties in y
y <- round(y, 1)
tau_a(x, y)
tau_b(x, y)

# Ties in x too
x <- round(x, 1)
tau_b(x, y)



