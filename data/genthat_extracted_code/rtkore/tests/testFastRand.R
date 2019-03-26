library(rtkore)

testFastRand <- function()
{
# check binomial random variates rtkore generator
set.seed(1)
ssim <- .Call("fastBinomialRand", 10, 25, 0.4, PACKAGE="rtkore")
set.seed(1)
rsim <- rbinom(10, 25, 0.4)
if (max(abs(ssim - rsim)))
{
  print("Binomial test failed\n")
  return(FALSE);
}

# check beta random variates rtkore generator
set.seed(1)
ssim <- .Call("fastBetaRand", 10, 0.5, 0.5, PACKAGE="rtkore")
set.seed(1)
rsim <- rbeta(10, 0.5, 0.5)
if (max(abs(ssim - rsim)))
{
  print("Beta test failed\n")
  return(FALSE);
}

# check Cauchy random variates rtkore generator
set.seed(1)
ssim <- .Call("fastCauchyRand", 10, 0, 3, PACKAGE="rtkore")
set.seed(1)
rsim <- rcauchy(10, 0, 3)
if (max(abs(ssim - rsim)))
{
  print("Cauchy test failed\n")
  return(FALSE);
}

# check chi-squared random variates rtkore generator
set.seed(1)
ssim <- .Call("fastChiSquaredRand", 10, 3, PACKAGE="rtkore")
set.seed(1)
rsim <- rchisq(10, 3)
if (max(abs(ssim - rsim)))
{
  print("chi-square test failed\n")
  return(FALSE);
}

# check exponential random variates rtkore generator
set.seed(1)
ssim <- .Call("fastExponentialRand", 10, 4, PACKAGE="rtkore")
set.seed(1)
rsim <- rexp(10, 1./4.)
if (max(abs(ssim - rsim)))
{
  print("exponential test failed\n")
  return(FALSE);
}

# check F random variates rtkore generator
set.seed(1)
ssim <- .Call("fastFisherSnedecorRand", 10, 3, 5, PACKAGE="rtkore")
set.seed(1)
rsim <- rf(10, 3, 5)
if (max(abs(ssim - rsim)))
{
  print("Fisher test failed\n")
  return(FALSE);
}

# check gamma random variates rtkore generator
set.seed(1)
ssim <- .Call("fastGammaRand", 10, 2, 2, PACKAGE="rtkore")
set.seed(1)
rsim <- rgamma(10, 2, 1/2)
if (max(abs(ssim - rsim)))
{
  print("gamma test failed\n")
  return(FALSE);
}

# check geometric random variates rtkore generator
set.seed(1)
ssim <- .Call("fastGeometricRand", 10, 0.4, PACKAGE="rtkore")
set.seed(1)
rsim <- rgeom(10, 0.4)
if (max(abs(ssim - rsim)))
{
  print("geometric test failed\n")
  return(FALSE);
}

# check hypergeometric random variates rtkore generator
set.seed(1)
ssim <- .Call("fastHyperGeometricRand", 10, 10, 20, 5, PACKAGE="rtkore")
set.seed(1)
rsim <- rhyper(10, 10, 20, 5)
if (max(abs(ssim - rsim)))
{
  print("hypergeometric test failed\n")
  return(FALSE);
}

# check logistic random variates rtkore generator
set.seed(1)
ssim <- .Call("fastLogisticRand", 10, 20, 5, PACKAGE="rtkore")
set.seed(1)
rsim <- rlogis(10, 20, 5)
if (max(abs(ssim - rsim)))
{
  print("logistic test failed\n")
  return(FALSE);
}

# check log-normal random variates rtkore generator
set.seed(1)
ssim <- .Call("fastLogNormalRand", 10, 20, 5, PACKAGE="rtkore")
set.seed(1)
rsim <- rlnorm(10, 20, 5)
if (max(abs(ssim - rsim)))
{
  print("log-normal test failed\n")
  return(FALSE);
}

# check negative binomial  random variates rtkore generator
set.seed(1)
ssim <- .Call("fastNegativeBinomialRand", 10, 20, 0.4, PACKAGE="rtkore")
set.seed(1)
rsim <- rnbinom(10, 20, 0.4)
if (max(abs(ssim - rsim)))
{
  print("negative binomial test failed\n")
  return(FALSE);
}

# check normal random variates rtkore generator
set.seed(1)
ssim <- .Call("fastNormalRand", 10, 20, 5, PACKAGE="rtkore")
set.seed(1)
rsim <- rnorm(10, 20, 5)
if (max(abs(ssim - rsim)))
{
  print("normal test failed\n")
  return(FALSE);
}

# check Poisson variates rtkore generator
set.seed(1)
ssim <- .Call("fastPoissonRand", 10, 5, PACKAGE="rtkore")
set.seed(1)
rsim <- rpois(10, 5)
if (max(abs(ssim - rsim)))
{
  print("Poisson test failed\n")
  return(FALSE);
}

# check Student's t random variates rtkore generator
set.seed(1)
ssim <- .Call("fastStudentRand", 10, 20, PACKAGE="rtkore")
set.seed(1)
rsim <- rt(10, 20)
if (max(abs(ssim - rsim)))
{
  print("t test failed\n")
  return(FALSE);
}

# check uniform random variates rtkore generator
set.seed(1)
ssim <- .Call("fastUniformRand", 10, -1, 1, PACKAGE="rtkore")
set.seed(1)
rsim <- runif(10, -1, 1)
if (max(abs(ssim - rsim)))
{
  print("uniform test failed\n")
  return(FALSE);
}

# check Weibull random variates rtkore generator
set.seed(1)
ssim <- .Call("fastWeibullRand", 10, 2, 2, PACKAGE="rtkore")
set.seed(1)
rsim <- rweibull(10, 2, 2)
if (max(abs(ssim - rsim)))
{
  print("Weibull test failed\n")
  return(FALSE);
}

return(TRUE)
}

# not implemented in R
.Call("fastUniformDiscreteRand", 10, -2, 2, PACKAGE="rtkore")
.Call("fastCategoricalRand", 10, c(0.1,0.2,0.7), PACKAGE="rtkore")

# call test
testFastRand()

