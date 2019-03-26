library(tadaatoolbox)


### Name: tadaa_one_sample
### Title: Tadaa, one-sample tests!
### Aliases: tadaa_one_sample

### ** Examples

set.seed(42)
df <- data.frame(x = rnorm(n = 20, mean = 100, sd = 1))

tadaa_one_sample(df, x, mu = 101, sigma = 1)

# No data.frame, just a vector
tadaa_one_sample(x = rnorm(20), mu = 0)



