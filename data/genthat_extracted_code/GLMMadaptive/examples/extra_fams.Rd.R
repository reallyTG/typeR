library(GLMMadaptive)


### Name: Extra Family Objects
### Title: Family functions for Beta, Zero-Inflated and Hurdle Poisson and
###   Negative Binomial, Hurdle Log-Normal, and Hurdle Beta Mixed Models
### Aliases: beta.fam zi.poisson zi.negative.binomial hurdle.poisson
###   hurdle.negative.binomial hurdle.lognormal hurdle.beta.fam

### ** Examples

# simulate some data from a negative binomial model
set.seed(102)
dd <- expand.grid(f1 = factor(1:3), f2 = LETTERS[1:2], g = 1:30, rep = 1:15,
                  KEEP.OUT.ATTRS = FALSE)
mu <- 5*(-4 + with(dd, as.integer(f1) + 4 * as.numeric(f2)))
dd$y <- rnbinom(nrow(dd), mu = mu, size = 0.5)

# Fit a zero-inflated Poisson model, with only fixed effects in the 
# zero-inflated part
fm1 <- mixed_model(fixed = y ~ f1 * f2, random = ~ 1 | g, data = dd, 
                  family = zi.poisson(), zi_fixed = ~ 1)

summary(fm1)

## No test: 
# We extend the previous model allowing also for a random intercept in the
# zero-inflated part
fm2 <- mixed_model(fixed = y ~ f1 * f2, random = ~ 1 | g, data = dd, 
                  family = zi.poisson(), zi_fixed = ~ 1, zi_random = ~ 1 | g)

# We do a likelihood ratio test between the two models
anova(fm1, fm2)

#############################################################################
#############################################################################

# The same as above but with a negative binomial model
gm1 <- mixed_model(fixed = y ~ f1 * f2, random = ~ 1 | g, data = dd, 
                  family = zi.negative.binomial(), zi_fixed = ~ 1)

summary(gm1)

# We do a likelihood ratio test between the Poisson and negative binomial models
anova(fm1, gm1)
## End(No test)



