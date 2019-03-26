library(OneTwoSamples)


### Name: one_sample
### Title: Deal with one (normal) sample
### Aliases: one_sample

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
one_sample(x, mu = 1, sigma = 0.2, side = 1)
one_sample(x, sigma = 0.2, side = 1)
one_sample(x, mu = 1, side = 1)
one_sample(x)



