library(micompr)


### Name: concat_outputs
### Title: Concatenate multiple outputs with multiple observations
### Aliases: concat_outputs

### ** Examples


# Collect 20 observations of 3 outputs with different scales and lengths

# Output 1, length 100
out1 <- matrix(rnorm(2000, mean = 0, sd = 1), nrow = 20)

# Output 2, length 200
out2 <- matrix(rnorm(4000, mean = 100, sd = 200), nrow = 20)

# Output 1, length 50
out3 <- matrix(rnorm(1000, mean = -1000, sd = 10), nrow = 20)

# Concatenate and range scale outputs, resulting matrix dimensions will be
# 20 x 350
outconcat <- concat_outputs(list(out1, out2, out3), "range")



