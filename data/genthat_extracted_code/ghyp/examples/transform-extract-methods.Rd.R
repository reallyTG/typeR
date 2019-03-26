library(ghyp)


### Name: transform-extract-methods
### Title: Linear transformation and extraction of generalized hyperbolic
###   distributions
### Aliases: transform.ghyp transform,ghyp-method [.ghyp
###   [,ghyp,numeric,missing,missing-method
### Keywords: utilities methods

### ** Examples

  ## Mutivariate generalized hyperbolic distribution
  multivariate.ghyp <- ghyp(sigma=var(matrix(rnorm(9),ncol=3)), mu=1:3, gamma=-2:0)

  ## Dimension reduces to 2
  transform(multivariate.ghyp, multiplier=matrix(1:6,nrow=2), summand=10:11)

  ## Dimension reduces to 1
  transform(multivariate.ghyp, multiplier=1:3)

  ## Simple transformation
  transform(multivariate.ghyp, summand=100:102)

  ## Extract some dimension
  multivariate.ghyp[1]
  multivariate.ghyp[c(1, 3)]



