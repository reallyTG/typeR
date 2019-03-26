library(lambda.tools)


### Name: pad
### Title: Pad a vector with some default value
### Aliases: pad

### ** Examples

# A moving average results in n - window + 1 results, so pad at the
# head to get a vector of length 50
x <- abs(rnorm(50))
m <- maprange(x, 10, mean)
pad(m, 9) 

# Pad at the end instead of the beginning. Note that the head must
# explicitly be set to 0
pad(m, 0, 9)

# Pad on both sides
pad(m, 4, 5) 

# Use a different default value
pad(m, 9, default=0)



