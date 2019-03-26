library(SHT)


### Name: norm.1972SF
### Title: Univariate Test of Normality by Shapiro and Francia (1972)
### Aliases: norm.1972SF

### ** Examples

## CRAN-purpose small example
x = rnorm(10)
norm.1972SF(x) # run the test

## No test: 
## generate samples from several distributions
x = stats::runif(496)            # uniform
y = stats::rgamma(496, shape=2)  # gamma
z = stats::rlnorm(496)           # log-normal

## test above samples
test.x = norm.1972SF(x) # uniform
test.y = norm.1972SF(y) # gamma
test.z = norm.1972SF(z) # log-normal
## End(No test)




