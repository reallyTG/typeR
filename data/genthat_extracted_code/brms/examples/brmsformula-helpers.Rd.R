library(brms)


### Name: brmsformula-helpers
### Title: Linear and Non-linear formulas in 'brms'
### Aliases: brmsformula-helpers bf-helpers nlf lf set_nl set_rescor
###   set_mecor

### ** Examples

# add more formulas to the model
bf(y ~ 1) + 
  nlf(sigma ~ a * exp(b * x)) + 
  lf(a ~ x, b ~ z + (1|g)) +
  gaussian()

# specify 'nl' later on
bf(y ~ a * inv_logit(x * b)) +
  lf(a + b ~ z) +
  set_nl(TRUE)
  
# specify a multivariate model
bf(y1 ~ x + (1|g)) + 
  bf(y2 ~ z) +
  set_rescor(TRUE)



