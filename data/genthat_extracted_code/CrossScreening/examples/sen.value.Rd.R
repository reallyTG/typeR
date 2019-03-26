library(CrossScreening)


### Name: sen.value
### Title: Compute sensitivity value
### Aliases: sen.value

### ** Examples

d <- rnorm(100) + 1
gamma.star <- kappa2gamma(sen.value(d, alpha = 0.05, mm = matrix(c(2, 2, 2, 8, 5, 8), ncol = 2)))
gamma.star
sen(d, mm = c(2, 2, 2), gamma = gamma.star[1])$p.value # should equal the significance level 0.05




