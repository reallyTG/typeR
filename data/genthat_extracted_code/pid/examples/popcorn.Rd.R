library(pid)


### Name: popcorn
### Title: Simulation of stovetop popcorn cooking
### Aliases: popcorn

### ** Examples

# Cooking for a very short duration is not supported.
# For example, popcorn(T=50) will fail

# Cooking from 77 seconds onwards is supported
popcorn(T=120)

# What happens if we leave the pot on the stove for too long?
popcorn(T=500)

# Can you find the optimum time to cook on the stove
# using the fewest number of function calls?



