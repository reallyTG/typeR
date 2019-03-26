library(parsec)


### Name: var2prof
### Title: Variables to profiles
### Aliases: var2prof wprof

### ** Examples

# 2 variables with 2 modalities, frequencies detected from population
pop <- matrix(sample(1:2, 200, replace=TRUE), 50, 2)
var2prof(varlen=c(2, 2))

# 2 variables:
# - mood: 2 modalities
# - weather: 3 modalities
# 2*3 profiles and frequencies sampled from a Binomial distribution n = 10, p = 0.5
var <- list(
    mood = ordered(c("bad", "good"), levels = c("bad", "good")),
    weather = ordered(c("rainy", "cloudy", "sunny"), levels = c("rainy", "cloudy", "sunny"))
)
var2prof(var, freq = rbinom(2*3, 10, 0.5), labtype = "progressive")



