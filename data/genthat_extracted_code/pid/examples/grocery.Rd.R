library(pid)


### Encoding: UTF-8

### Name: grocery
### Title: Simulation of grocery store profits for a single product
### Aliases: grocery

### ** Examples

# Selling at the default settings of price (€3.46)
# and shelf height (150cm):
grocery()

# Let's try selling for a low price, €2.75,
# and put the product 120 cm off the ground
grocery(P=2.75, H=120)

# What happens if the product is too high
# for the average person?
grocery(P=1.25, H=200)

# Can you find the optimum combination of settings to
# maximize the profit, but using only a few experiments?



