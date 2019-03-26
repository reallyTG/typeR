library(SHT)


### Name: norm.1965SW
### Title: Univariate Test of Normality by Shapiro and Wilk (1965)
### Aliases: norm.1965SW

### ** Examples

## generate samples from several distributions
x = stats::runif(28)            # uniform
y = stats::rgamma(28, shape=2)  # gamma
z = stats::rlnorm(28)           # log-normal

## test above samples
test.x = norm.1965SW(x) # uniform
test.y = norm.1965SW(y) # gamma
test.z = norm.1965SW(z) # log-normal




