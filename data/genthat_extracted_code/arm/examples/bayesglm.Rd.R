library(arm)


### Name: bayesglm
### Title: Bayesian generalized linear models.
### Aliases: bayesglm-class bayesglm bayesglm.fit print,bayesglm-method
###   show,bayesglm-method predict.bayesglm
### Keywords: models methods regression

### ** Examples

  n <- 100
  x1 <- rnorm (n)
  x2 <- rbinom (n, 1, .5)
  b0 <- 1
  b1 <- 1.5
  b2 <- 2
  y <- rbinom (n, 1, invlogit(b0+b1*x1+b2*x2))

  M1 <- glm (y ~ x1 + x2, family=binomial(link="logit"))
  display (M1)

  M2 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=Inf, prior.df=Inf)
  display (M2)  # just a test:  this should be identical to classical logit

  M3 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"))
    # default Cauchy prior with scale 2.5
  display (M3)

  M4 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=2.5, prior.df=1)
    # Same as M3, explicitly specifying Cauchy prior with scale 2.5
  display (M4)

  M5 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=2.5, prior.df=7)   # t_7 prior with scale 2.5
  display (M5)

  M6 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=2.5, prior.df=Inf)  # normal prior with scale 2.5
  display (M6)

# Create separation:  set y=1 whenever x2=1
# Now it should blow up without the prior!

  y <- ifelse (x2==1, 1, y)

  M1 <- glm (y ~ x1 + x2, family=binomial(link="logit"))
  display (M1)

  M2 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=Inf, prior.scale.for.intercept=Inf) # Same as M1
  display (M2)

  M3 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"))
  display (M3)

  M4 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=2.5, prior.scale.for.intercept=10)  # Same as M3
  display (M4)

  M5 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=2.5, prior.df=7)
  display (M5)

  M6 <- bayesglm (y ~ x1 + x2, family=binomial(link="logit"),
    prior.scale=2.5, prior.df=Inf)
  display (M6)

  # bayesglm with gaussian family (bayes lm)
  sigma <- 5
  y2 <- rnorm (n, b0+b1*x1+b2*x2, sigma)
  M7 <- bayesglm (y2 ~ x1 + x2, prior.scale=Inf, prior.df=Inf)
  display (M7)


  # bayesglm with categorical variables
  z1 <- trunc(runif(n, 4, 9))
  levels(factor(z1))
  z2 <- trunc(runif(n, 15, 19))
  levels(factor(z2))

  ## drop the base level (R default)
  M8 <- bayesglm (y ~ x1 + factor(z1) + factor(z2),
    family=binomial(link="logit"), prior.scale=2.5, prior.df=Inf)
  display (M8)

  ## keep all levels with the intercept, keep the variable order
  M9 <- bayesglm (y ~ x1 + x1:x2 + factor(z1) + x2 + factor(z2),
    family=binomial(link="logit"),
    prior.mean=rep(0,12),
    prior.scale=rep(2.5,12),
    prior.df=rep(Inf,12),
    prior.mean.for.intercept=0,
    prior.scale.for.intercept=10,
    prior.df.for.intercept=1,
    drop.baseline=FALSE, keep.order=TRUE)
  display (M9)

  ## keep all levels without the intercept
  M10 <- bayesglm (y ~ x1 + factor(z1) + x1:x2 + factor(z2)-1,
    family=binomial(link="logit"),
    prior.mean=rep(0,11),
    prior.scale=rep(2.5,11),
    prior.df=rep(Inf,11),
    drop.baseline=FALSE)
  display (M10)




