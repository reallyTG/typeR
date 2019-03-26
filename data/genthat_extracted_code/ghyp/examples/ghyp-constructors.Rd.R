library(ghyp)


### Name: ghyp-constructors
### Title: Create generalized hyperbolic distribution objects
### Aliases: ghyp hyp NIG student.t VG gauss ghyp.ad hyp.ad NIG.ad
###   student.t.ad VG.ad
### Keywords: distribution multivariate models

### ** Examples

  ## alpha.bar parametrization of a univariate GH distribution
  ghyp(lambda=2, alpha.bar=0.1, mu=0, sigma=1, gamma=0)
  ## lambda/chi parametrization of a univariate GH distribution
  ghyp(lambda=2, chi=1, psi=0.5, mu=0, sigma=1, gamma=0)
  ## alpha/delta parametrization of a univariate GH distribution
  ghyp.ad(lambda=2, alpha=0.5, delta=1, mu=0, beta=0)

  ## alpha.bar parametrization of a multivariate GH distribution
  ghyp(lambda=1, alpha.bar=0.1, mu=2:3, sigma=diag(1:2), gamma=0:1)
  ## lambda/chi parametrization of a multivariate GH distribution
  ghyp(lambda=1, chi=1, psi=0.5, mu=2:3, sigma=diag(1:2), gamma=0:1)
  ## alpha/delta parametrization of a multivariate GH distribution
  ghyp.ad(lambda=1, alpha=2.5, delta=1, mu=2:3, Delta=diag(c(1,1)), beta=0:1)

  ## alpha.bar parametrization of a univariate hyperbolic distribution
  hyp(alpha.bar=0.3, mu=1, sigma=0.1, gamma=0)
  ## lambda/chi parametrization of a univariate hyperbolic distribution
  hyp(chi=1, psi=2, mu=1, sigma=0.1, gamma=0)
  ## alpha/delta parametrization of a univariate hyperbolic distribution
  hyp.ad(alpha=0.5, delta=1, mu=0, beta=0)

  ## alpha.bar parametrization of a univariate NIG distribution
  NIG(alpha.bar=0.3, mu=1, sigma=0.1, gamma=0)
  ## lambda/chi parametrization of a univariate NIG distribution
  NIG(chi=1, psi=2, mu=1, sigma=0.1, gamma=0)
  ## alpha/delta parametrization of a univariate NIG distribution
  NIG.ad(alpha=0.5, delta=1, mu=0, beta=0)

  ## alpha.bar parametrization of a univariate VG distribution
  VG(lambda=2, mu=1, sigma=0.1, gamma=0)
  ## alpha/delta parametrization of a univariate VG distribution
  VG.ad(lambda=2, alpha=0.5, mu=0, beta=0)

  ## alpha.bar parametrization of a univariate t distribution
  student.t(nu = 3, mu=1, sigma=0.1, gamma=0)
  ## alpha/delta parametrization of a univariate t distribution
  student.t.ad(lambda=-2, delta=1, mu=0, beta=1)

  ## Obtain equal results as with the R-core parametrization
  ## of the t distribution:
  nu <- 4
  standard.R.chi.psi <- student.t(nu = nu, chi = nu)
  standard.R.alpha.bar <- student.t(nu = nu, sigma = sqrt(nu  /(nu - 2)))

  random.sample <- rnorm(3)
  dt(random.sample, nu)
  dghyp(random.sample, standard.R.chi.psi)   # all implementations yield...
  dghyp(random.sample, standard.R.alpha.bar) # ...the same values

  random.quantiles <- runif(4)
  qt(random.quantiles, nu)
  qghyp(random.quantiles, standard.R.chi.psi)   # all implementations yield...
  qghyp(random.quantiles, standard.R.alpha.bar) # ...the same values

  ## If nu <= 2 the "alpha.bar" parametrization does not exist, but the
  ## "chi/psi" parametrization. The case of a Cauchy distribution:
  nu <- 1
  standard.R.chi.psi <- student.t(nu = nu, chi = nu)

  dt(random.sample, nu)
  dghyp(random.sample, standard.R.chi.psi)   # both give the same result

  pt(random.sample, nu)
  pghyp(random.sample, standard.R.chi.psi) # both give the same result




