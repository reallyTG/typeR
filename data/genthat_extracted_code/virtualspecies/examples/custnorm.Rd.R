library(virtualspecies)


### Name: custnorm
### Title: Normal function defined by extremes
### Aliases: custnorm

### ** Examples

# Let's define the response of a species to temperature which
#  - has an optimum at 20 degrees C
#  - occurs 99% of the time between 13 and 27 degrees C.
# In that case, mean = 20, diff = 7, and prob = 0.99

# First, we generate an arbitrary temperature variable 
# between 0 and 30 degrees C
temp <- seq(0, 30, length = 1000)


# Then, we calculate the response to this variable with the chosen values
response <- custnorm(x = temp, mean = 20, diff = 7, prob = .99)

plot(response ~ temp, type = "l")



